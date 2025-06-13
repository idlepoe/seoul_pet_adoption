import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:seoul_pet_adoption/services/api_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends ConsumerWidget {
  final int animalId;

  const DetailScreen({
    super.key,
    required this.animalId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalAsync = ref.watch(animalDetailProvider(animalId));

    if (animalAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (animalAsync.hasError) {
      return Center(
        child: Text('Error: ${animalAsync.error}'),
      );
    }

    final animal = animalAsync.value!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('상세 정보'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 보호소명
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/shelter_icon.png'),
                    radius: 18,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '서울동물복지지원센터',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Icon(Icons.verified, color: Colors.green, size: 18),
                ],
              ),
            ),
            // 상태(완료/입양 등)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  animal.ADOPT_STATUS,
                  style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // 메인 이미지
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                animal.IMG_URL,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.pets, size: 48, color: Colors.grey),
                ),
              ),
            ),
            // 썸네일 리스트 (예시: 메인 이미지 반복)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 3,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, idx) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      animal.IMG_URL,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // 품종/이름/정보
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text('[${animal.ANIMAL_TYPE}] ${animal.ANIMAL_NM}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('스토리+', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('${animal.ANIMAL_BREED} (중성화 ${animal.FOSTER_STATUS}) / ${animal.ANIMAL_SEX} / ${animal.ANIMAL_BRITH_YMD}(년생) / ${animal.WEIGHT_KG}(Kg)', style: const TextStyle(fontSize: 14, color: Colors.black87)),
            ),
            const SizedBox(height: 12),
            // 정보 테이블
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoRow(label: '공고번호', value: animal.id, valueColor: Colors.orange),
                  _InfoRow(label: '공고기간', value: '2025-03-06 ~ 2025-03-17'), // 예시, 실제 데이터로 교체
                  _InfoRow(label: '발견장소', value: animal.CONT),
                  _InfoRow(label: '특이사항', value: '개체관리번호 0432 - 2주차'), // 예시, 실제 데이터로 교체
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 모든 정보 테이블
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('상세 정보', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  _InfoRow(label: 'id', value: animal.id),
                  _InfoRow(label: '이름', value: animal.ANIMAL_NM),
                  _InfoRow(label: '종류', value: animal.ANIMAL_TYPE),
                  _InfoRow(label: '품종', value: animal.ANIMAL_BREED),
                  _InfoRow(label: '성별', value: animal.ANIMAL_SEX),
                  _InfoRow(label: '나이', value: animal.ANIMAL_BRITH_YMD),
                  _InfoRow(label: '체중', value: animal.WEIGHT_KG),
                  _InfoRow(label: '등록일', value: animal.ADMISSION_DT),
                  _InfoRow(label: '입양상태', value: animal.ADOPT_STATUS),
                  _InfoRow(label: '임시보호', value: animal.FOSTER_STATUS),
                  _InfoRow(label: '이미지', value: animal.IMG_URL),
                  _InfoRow(label: '동영상', value: animal.MOVIE_URL),
                  _InfoRow(label: '구조장소', value: animal.CONT),
                  _InfoRow(label: 'updatedAt', value: animal.updatedAt?.toString() ?? ''),
                  _InfoRow(label: 'viewCount', value: animal.viewCount.toString()),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 하단 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {},
                      child: const Text('전화문의', style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  Column(
                    children: [
                      const Icon(Icons.remove_red_eye, size: 20, color: Colors.grey),
                      Text('${animal.viewCount}', style: const TextStyle(fontSize: 13, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  const _InfoRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: valueColor ?? Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
} 