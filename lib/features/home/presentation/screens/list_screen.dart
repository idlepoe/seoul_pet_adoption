import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seoul_pet_adoption/services/api_service.dart';
import '../widgets/animal_card.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animalsAsync = ref.watch(animalsProvider);

    if (animalsAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (animalsAsync.hasError) {
      return Center(
        child: Text('Error: ${animalsAsync.error}'),
      );
    }

    final animals = animalsAsync.value ?? [];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: animals.length,
      itemBuilder: (context, index) {
        final animal = animals[index];
        return AnimalCard(
          animal: animal,
          onTap: () => context.go('/home/detail/${animal.seq}'),
        );
      },
    );
  }
} 