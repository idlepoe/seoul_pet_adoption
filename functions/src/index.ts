import {onRequest} from "firebase-functions/v2/https";

import * as admin from 'firebase-admin';
import axios from 'axios';
import { onSchedule } from 'firebase-functions/v2/scheduler';
import {setGlobalOptions} from "firebase-functions";

admin.initializeApp();
setGlobalOptions({region: 'asia-northeast3'});

const API_KEY = '497243664869646c38307271785848';
const BASE_URL = 'http://openapi.seoul.go.kr:8088';

interface PetInfo {
  SEQ: number;
  ANIMAL_NM: string;
  ADMISSION_DT: string;
  ANIMAL_TYPE: string;
  ANIMAL_BREED: string;
  ANIMAL_SEX: string;
  ANIMAL_BRITH_YMD: string;
  WEIGHT_KG: string;
  ADOPT_STATUS: string;
  FOSTER_STATUS: string;
  MOVIE_URL: string;
  CONT: string;
  [key: string]: any;
}

interface PetImage {
  SEQ: number;
  IMG_TYPE: string;
  IMG_NUM: number;
  IMG_URL: string;
  [key: string]: any;
}

interface ApiResponse<T> {
  vPetInfo?: { row: T[] };
  vPetImg?: { row: T[] };
}

async function syncPetDataToFirestore() {
  try {
    // 펫 정보 가져오기
    const petInfoResponse = await axios.get<ApiResponse<PetInfo>>(
      `${BASE_URL}/${API_KEY}/json/vPetInfo/1/1000/`
    );
    
    // 펫 이미지 정보 가져오기
    const petImageResponse = await axios.get<ApiResponse<PetImage>>(
      `${BASE_URL}/${API_KEY}/json/vPetImg/1/1000/`
    );

    console.log('Pet Info Response:', JSON.stringify(petInfoResponse.data, null, 2));
    console.log('Pet Image Response:', JSON.stringify(petImageResponse.data, null, 2));

    const petInfoList: PetInfo[] = petInfoResponse.data?.vPetInfo?.row || [];
    const petImageList: PetImage[] = petImageResponse.data?.vPetImg?.row || [];

    if (petInfoList.length === 0) {
      throw new Error('No pet info data received');
    }

    // 이미지 정보를 Map<SEQ, string[]>으로 변환하여 여러 이미지 지원
    const imageMap = new Map<number, string[]>();
    for (const img of petImageList) {
      if (!imageMap.has(img.SEQ)) {
        imageMap.set(img.SEQ, []);
      }
      imageMap.get(img.SEQ)!.push(img.IMG_URL);
    }

    // 데이터 병합 및 Firebase에 저장
    const batch = admin.firestore().batch();
    const petsCollection = admin.firestore().collection('pets');

    for (const pet of petInfoList) {
      const petData = {
        ...pet,
        IMG_URLS: imageMap.get(pet.SEQ) || [],
        updatedAt: admin.firestore.FieldValue.serverTimestamp()
      };

      const docRef = petsCollection.doc(pet.SEQ.toString());
      batch.set(docRef, petData, { merge: true });
    }

    await batch.commit();
    return { success: true, message: 'Successfully synced pet data' };
  } catch (error) {
    console.error('Error syncing pet data:', error);
    throw error;
  }
}

// 자동 스케줄러
export const syncPetData = onSchedule({
  schedule: "0 0 * * *",
  timeZone: "Asia/Seoul"
}, async (event) => {
  await syncPetDataToFirestore();
});

// 수동 동기화를 위한 HTTP 함수
export const manualSyncPetData = onRequest(async (req, res) => {
  try {
    const result = await syncPetDataToFirestore();
    res.json(result);
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Failed to sync pet data',
      error: error instanceof Error ? error.message : 'Unknown error'
    });
  }
});

// 펫 목록 조회 함수
export const getPetList = onRequest(async (req, res) => {
  try {
    const petsCollection = admin.firestore().collection('pets');
    const snapshot = await petsCollection
      .orderBy('updatedAt', 'desc')
      .get();

    const pets = snapshot.docs.map(doc => ({
      id: doc.id,
      ...doc.data()
    }));

    res.json({
      success: true,
      data: pets
    });
  } catch (error) {
    console.error('Error fetching pet list:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch pet list',
      error: error instanceof Error ? error.message : 'Unknown error'
    });
  }
});

// 펫 상세 정보 조회 함수
export const getPetDetail = onRequest(async (req, res) => {
  try {
    const { id } = req.query;
    if (!id) {
      res.status(400).json({ success: false, message: 'Pet ID is required' });
      return;
    }

    const docRef = admin.firestore().collection('pets').doc(id.toString());
    const doc = await docRef.get();

    if (!doc.exists) {
      res.status(404).json({ success: false, message: 'Pet not found' });
      return;
    }

    // viewCount 증가 처리
    await docRef.update({
      viewCount: admin.firestore.FieldValue.increment(1),
    });

    // 최신 데이터 다시 읽기 (viewCount 반영)
    const updatedDoc = await docRef.get();

    res.json({
      success: true,
      data: {
        id: updatedDoc.id,
        ...updatedDoc.data()
      }
    });
  } catch (error) {
    console.error('Error fetching pet detail:', error);
    res.status(500).json({
      success: false,
      message: 'Failed to fetch pet detail',
      error: error instanceof Error ? error.message : 'Unknown error'
    });
  }
});
