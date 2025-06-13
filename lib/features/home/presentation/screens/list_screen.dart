import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seoul_pet_adoption/features/home/presentation/screens/detail_screen.dart';
import 'package:seoul_pet_adoption/services/api_service.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import '../widgets/animal_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

final recent3MonthsFilterProvider = StateProvider<bool>((ref) => false);
final adoptStatusFilterProvider = StateProvider<bool>((ref) => false);
final fosterStatusFilterProvider = StateProvider<bool>((ref) => false);

enum AnimalSortType { age, admission, viewCount }

final animalSortTypeProvider = StateProvider<AnimalSortType>((ref) => AnimalSortType.admission);

final filteredAnimalsProvider = FutureProvider((ref) async {
  final animals = await ref.watch(animalsProvider.future);
  final recent3 = ref.watch(recent3MonthsFilterProvider);
  final adopt = ref.watch(adoptStatusFilterProvider);
  final foster = ref.watch(fosterStatusFilterProvider);
  final sortType = ref.watch(animalSortTypeProvider);
  DateTime now = DateTime.now();
  var filtered = animals.where((a) {
    bool ok = true;
    if (recent3) {
      final cleaned = a.ADMISSION_DT.replaceAll(RegExp(r'[^0-9]'), '');
      if (cleaned.length >= 8) {
        final year = int.parse(cleaned.substring(0, 4));
        final month = int.parse(cleaned.substring(4, 6));
        final day = int.parse(cleaned.substring(6, 8));
        final date = DateTime(year, month, day);
        ok &= date.isAfter(now.subtract(const Duration(days: 90)));
      }
    }
    if (adopt) {
      ok &= a.ADOPT_STATUS == '입양문의가능';
    }
    if (foster) {
      ok &= a.FOSTER_STATUS == '임시보호가능';
    }
    return ok;
  }).toList();

  // 정렬
  switch (sortType) {
    case AnimalSortType.age:
      filtered.sort((a, b) => _calculateAgeDouble(a.ANIMAL_BRITH_YMD).compareTo(_calculateAgeDouble(b.ANIMAL_BRITH_YMD)));
      break;
    case AnimalSortType.admission:
      filtered.sort((a, b) => b.ADMISSION_DT.compareTo(a.ADMISSION_DT));
      break;
    case AnimalSortType.viewCount:
      filtered.sort((a, b) => b.viewCount.compareTo(a.viewCount));
      break;
  }
  return filtered;
});

double _calculateAgeDouble(String birthYmd) {
  try {
    final now = DateTime.now();
    final cleaned = birthYmd.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.length < 4) return 0;
    final year = int.parse(cleaned.substring(0, 4));
    final month = cleaned.length >= 6 ? int.parse(cleaned.substring(4, 6)) : 1;
    final day = cleaned.length >= 8 ? int.parse(cleaned.substring(6, 8)) : 1;
    final birth = DateTime(year, month, day);
    final diff = now.difference(birth);
    final age = diff.inDays / 365.25;
    return age;
  } catch (_) {
    return 0;
  }
}

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  static Future<void> showInfoDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('앱 안내'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('이 앱은 서울시 시립 동물 복지 지원센터의 비공식 앱입니다.'),
            SizedBox(height: 8),
            Text('서울 열린데이터 광장의 "서울동물복지지원센터 반려동물 입양 정보"와 "서울동물복지지원센터 반려동물 입양 사진" 데이터를 사용합니다.'),
            SizedBox(height: 8),
            Text('비상업적 목적으로 제작되었으며, 데이터는 매일 1회 갱신됩니다.'),
            SizedBox(height: 8),
            Text('반려동물 입양에 대한 많은 관심을 부탁드리며, 더 나은 입양 문화를 위해 제작하였습니다.'),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () async {
                final url = Uri.parse('https://data.seoul.go.kr/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              child: Text(
                '출처: 서울 열린데이터 광장',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 최초 1회 다이얼로그
    Future.microtask(() async {
      final prefs = await SharedPreferences.getInstance();
      final shown = prefs.getBool('infoDialogShown') ?? false;
      if (!shown) {
        await showInfoDialog(context);
        await prefs.setBool('infoDialogShown', true);
      }
    });

    final animalsAsync = ref.watch(filteredAnimalsProvider);
    final recent3 = ref.watch(recent3MonthsFilterProvider);
    final adopt = ref.watch(adoptStatusFilterProvider);
    final foster = ref.watch(fosterStatusFilterProvider);
    final sortType = ref.watch(animalSortTypeProvider);

    // AppBar actions에 info 버튼 추가
    final appBar = AppBar(
      title: const Text('서울시립동물복지지원센터'),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          tooltip: '앱 정보',
          onPressed: () => showInfoDialog(context),
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _FilterChip(
                              label: '최근 3개월',
                              selected: recent3,
                              onTap: () => ref.read(recent3MonthsFilterProvider.notifier).state = !recent3,
                            ),
                            const SizedBox(width: 8),
                            _FilterChip(
                              label: '입양문의가능',
                              selected: adopt,
                              onTap: () => ref.read(adoptStatusFilterProvider.notifier).state = !adopt,
                            ),
                            const SizedBox(width: 8),
                            _FilterChip(
                              label: '임시보호가능',
                              selected: foster,
                              onTap: () => ref.read(fosterStatusFilterProvider.notifier).state = !foster,
                            ),
                          ],
                        ),
                      ),
                      // Gradient 오버레이
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: IgnorePointer(
                          child: Container(
                            width: 32,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                                  Theme.of(context).scaffoldBackgroundColor,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _SortDropdown(sortType: sortType, onChanged: (val) => ref.read(animalSortTypeProvider.notifier).state = val),
                const SizedBox(width: 8),
              ],
            ),
          ),
          Expanded(
            child: animalsAsync.when(
              data: (animals) => ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                itemCount: animals.length,
                separatorBuilder: (context, index) => const SizedBox(height: 4),
                itemBuilder: (context, index) {
                  final animal = animals[index];
                  return AnimalCard(
                    animal: animal,
                    onTap: (){
                      Navigator.of(context).push(
                        SwipeablePageRoute(
                          builder: (context) => DetailScreen(animalId: int.parse(animal.id)),
                        ),
                      );
                    },
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator(strokeCap: StrokeCap.round)),
              error: (e, _) => Center(child: Text('에러 발생: $e')),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _FilterChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ChoiceChip(
            label: Padding(
              padding: const EdgeInsets. only(bottom: 2),
              child: Text(
                label,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            selected: selected,
            onSelected: (_) => onTap(),
            selectedColor: Colors.grey[200],
            backgroundColor: Colors.white,
            shape: StadiumBorder(side: BorderSide(color: Colors.grey[300]!, width: 1.5)),
            labelPadding: EdgeInsets.only(left: 16, right: (selected?32:16)),
            padding: EdgeInsets.zero,
            showCheckmark: false,
          ),
          if (selected)
            Positioned(
              top: 2,
              right: 5,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 24,
                  height: 32,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: const Icon(Icons.close, size: 18, color: Colors.black38),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SortDropdown extends StatelessWidget {
  final AnimalSortType sortType;
  final ValueChanged<AnimalSortType> onChanged;
  const _SortDropdown({required this.sortType, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<AnimalSortType>(
        icon: const Icon(Icons.sort, size: 28),
        value: sortType,
        onChanged: (val) {
          if (val != null) onChanged(val);
        },
        items: const [
          DropdownMenuItem(
            value: AnimalSortType.age,
            child: Text('나이순'),
          ),
          DropdownMenuItem(
            value: AnimalSortType.admission,
            child: Text('등록일순'),
          ),
          DropdownMenuItem(
            value: AnimalSortType.viewCount,
            child: Text('관심도순'),
          ),
        ],
      ),
    );
  }
} 