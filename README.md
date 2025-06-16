# 🐾 Seoul Pet Adoption

> 서울동물복지지원센터의 반려동물 입양 정보를 한눈에

**Seoul Pet Adoption**은 서울동물복지지원센터의 반려동물 입양 정보를 쉽고 빠르게 확인할 수 있는 앱입니다.

Flutter + Firebase 기반으로 제작되었으며, 상태관리는 GetX, OTA 업데이트는 Shorebird로 처리됩니다.

---

## 🌐 공식 서비스

- 📱 Google Play: [Seoul Pet Adoption 앱 설치하기](https://play.google.com/store/apps/details?id=com.jylee.seoul_pet_adoption) - 미정

---

## 🚀 주요 기능

- �� **입양 정보**: 서울동물복지지원센터의 반려동물 입양 정보 제공

---

## 🛠️ 주요 기술스택

### Frontend (Flutter)
- **Flutter**: 크로스플랫폼 UI 프레임워크
- **Dart**: Flutter 앱 개발 언어
- **Riverpod**: 상태 관리 (flutter_riverpod, riverpod_annotation)
- **Freezed**: 불변 데이터 모델 및 코드 생성
- **GoRouter**: 라우팅 및 네비게이션
- **Dio**: 네트워크 통신
- **Firebase**: 인증, Functions, Firestore 연동
- **Custom Font**: `SeoulHangangB` 폰트 적용

### Backend (Cloud Functions)
- **Node.js (v22) + TypeScript**
- **Firebase Functions**: 서버리스 API
- **Firebase Admin SDK**: Firestore 데이터 관리
- **Axios**: 외부 API(서울시 동물 입양 API) 연동