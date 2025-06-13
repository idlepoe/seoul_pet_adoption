import 'package:flutter/material.dart';
import 'package:seoul_pet_adoption/models/animal.dart';

class AnimalCard extends StatelessWidget {
  final Animal animal;
  final VoidCallback onTap;

  const AnimalCard({
    super.key,
    required this.animal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                'https://example.com/images/${animal.seq}.jpg', // 실제 이미지 URL로 변경 필요
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.pets,
                      size: 48,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.animalNm,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${animal.animalType} · ${animal.animalSex == 'M' ? '수컷' : '암컷'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    animal.adoptStatus,
                    style: TextStyle(
                      fontSize: 14,
                      color: animal.adoptStatus == '입양문의가능' ? Colors.green : Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 