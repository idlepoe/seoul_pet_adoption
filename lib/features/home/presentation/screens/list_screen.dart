import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seoul_pet_adoption/services/api_service.dart';
import '../widgets/animal_card.dart';

final recent3MonthsFilterProvider = StateProvider<bool>((ref) => false);
final adoptStatusFilterProvider = StateProvider<bool>((ref) => false);
final fosterStatusFilterProvider = StateProvider<bool>((ref) => false);

final filteredAnimalsProvider = FutureProvider((ref) async {
  final animals = await ref.watch(animalsProvider.future);
  final recent3 = ref.watch(recent3MonthsFilterProvider);
  final adopt = ref.watch(adoptStatusFilterProvider);
  final foster = ref.watch(fosterStatusFilterProvider);
  DateTime now = DateTime.now();
  return animals.where((a) {
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
});

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalsAsync = ref.watch(filteredAnimalsProvider);
    final recent3 = ref.watch(recent3MonthsFilterProvider);
    final adopt = ref.watch(adoptStatusFilterProvider);
    final foster = ref.watch(fosterStatusFilterProvider);

    return Column(
      children: [
        SizedBox(
          height: 48,
          child: SingleChildScrollView(
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
                  onTap: () => context.go('/home/detail/${animal.id}'),
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('에러 발생: $e')),
          ),
        ),
      ],
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