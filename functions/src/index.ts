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

    // 이미지 정보를 Map으로 변환하여 빠른 조회 가능하게 함
    const imageMap = new Map(
      petImageList.map(img => [img.SEQ, img.IMG_URL])
    );

    // 데이터 병합 및 Firebase에 저장
    const batch = admin.firestore().batch();
    const petsCollection = admin.firestore().collection('pets');

    for (const pet of petInfoList) {
      const petData = {
        ...pet,
        IMG_URL: imageMap.get(pet.SEQ) || '',
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
      res.status(400).json({
        success: false,
        message: 'Pet ID is required'
      });
      return;
    }

    const doc = await admin.firestore()
      .collection('pets')
      .doc(id.toString())
      .get();

    if (!doc.exists) {
      res.status(404).json({
        success: false,
        message: 'Pet not found'
      });
      return;
    }

    res.json({
      success: true,
      data: {
        id: doc.id,
        ...doc.data()
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
