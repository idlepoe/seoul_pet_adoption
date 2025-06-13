import 'package:flutter/material.dart';
import 'package:seoul_pet_adoption/models/animal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:seoul_pet_adoption/features/home/presentation/widgets/chips.dart';

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
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: animal.IMG_URLS.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: animal.IMG_URLS.first,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 90,
                              height: 90,
                              color: Colors.grey[200],
                              child: const Center(child: CircularProgressIndicator(strokeWidth: 2, strokeCap: StrokeCap.round)),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 90,
                              height: 90,
                              color: Colors.grey[300],
                              child: const Icon(Icons.pets, size: 40, color: Colors.grey),
                            ),
                          )
                        : Container(
                            width: 90,
                            height: 90,
                            color: Colors.grey[300],
                            child: const Icon(Icons.pets, size: 40, color: Colors.grey),
                          ),
                  ),
                  const SizedBox(height: 12),
                      StatusChip(animal.ADOPT_STATUS, color: Colors.green[100], textColor: Colors.green[800]),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(animal.ANIMAL_NM, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text('품종: ', style: TextStyle(fontSize: 13)),
                            AnimalTypeChip(animal.ANIMAL_TYPE, animal.ANIMAL_BRITH_YMD),
                            const SizedBox(width: 4),
                            BreedChip(animal.ANIMAL_BREED),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text('성별: ', style: TextStyle(fontSize: 13)),
                            GenderChip(animal.ANIMAL_SEX),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text('나이: ', style: TextStyle(fontSize: 13)),
                            AgeChip(animal.ANIMAL_BRITH_YMD),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Text('체중: ', style: TextStyle(fontSize: 13)),
                            WeightChip(animal.WEIGHT_KG),
                          ],
                        ),                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '등록일: ${animal.ADMISSION_DT}',
                  style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _calculateAge(String birthYmd) {
    try {
      final now = DateTime.now();
      // YYYY-MM-DD 또는 YYYYMMDD 형태 모두 지원
      final cleaned = birthYmd.replaceAll(RegExp(r'[^0-9]'), '');
      if (cleaned.length < 4) return '?';
      final year = int.parse(cleaned.substring(0, 4));
      final month = cleaned.length >= 6 ? int.parse(cleaned.substring(4, 6)) : 1;
      final day = cleaned.length >= 8 ? int.parse(cleaned.substring(6, 8)) : 1;
      final birth = DateTime(year, month, day);
      final diff = now.difference(birth);
      final age = diff.inDays / 365.25;
      return age.toStringAsFixed(1);
    } catch (_) {
      return '?';
    }
  }

  String _animalTypeWithIcon(String type) {
    if (type == 'DOG' || type == '[DOG]') {
      return '🐶 개';
    } else if (type == 'CAT' || type == '[CAT]') {
      return '🐱 고양이';
    } else {
      return type;
    }
  }
}

class StatusChip extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;
  const StatusChip(this.label, {this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color txtColor;
    if (label.contains('진행중')) {
      bgColor = Colors.orange[100]!;
      txtColor = Colors.orange[800]!;
    } else {
      bgColor = Colors.green[100]!;
      txtColor = Colors.green[800]!;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: txtColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class GenderChip extends StatelessWidget {
  final String sex;
  const GenderChip(this.sex);

  @override
  Widget build(BuildContext context) {
    final isMale = sex == 'M' || sex == '수컷';
    final isFemale = sex == 'W' || sex == '암컷';
    final displayText = isMale
        ? '수컷'
        : isFemale
            ? '암컷'
            : sex;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isMale ? Colors.blue[50] : isFemale ? Colors.pink[50] : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isMale ? Icons.male : isFemale ? Icons.female : Icons.help_outline,
            size: 16,
            color: isMale ? Colors.blue : isFemale ? Colors.red : Colors.grey,
          ),
          const SizedBox(width: 3),
          Text(
            displayText,
            style: TextStyle(
              fontSize: 13,
              color: isMale ? Colors.blue : isFemale ? Colors.red : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimalTypeChip extends StatelessWidget {
  final String type;
  final String birthYmd;
  const AnimalTypeChip(this.type, this.birthYmd);

  @override
  Widget build(BuildContext context) {
    final age = _calculateAgeDouble(birthYmd);
    String label = type;
    Color? color;
    if (type == 'DOG' || type == '[DOG]') {
      label = age < 1.0 ? '강아지' : '개';
      color = const Color(0xFFD2B48C); // 연갈색
    } else if (type == 'CAT' || type == '[CAT]') {
      label = age < 1.0 ? '새끼 고양이' : '고양이';
      color = Colors.grey[400];
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}

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

class BreedChip extends StatelessWidget {
  final String breed;
  const BreedChip(this.breed);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        breed,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.deepOrange),
      ),
    );
  }
}

class AgeChip extends StatelessWidget {
  final String birthYmd;
  const AgeChip(this.birthYmd);

  @override
  Widget build(BuildContext context) {
    final age = _calculateAgeDouble(birthYmd);
    final color = Color.lerp(Colors.lightBlue[100], Colors.blue[900], (age / 20).clamp(0, 1));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '${age.toStringAsFixed(1)}살',
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class WeightChip extends StatelessWidget {
  final String weight;
  const WeightChip(this.weight);

  @override
  Widget build(BuildContext context) {
    double w = double.tryParse(weight.replaceAll(RegExp(r'[^0-9\.]'), '')) ?? 0;
    final color = Color.lerp(Colors.green[100], Colors.green[900], (w / 40).clamp(0, 1));
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '${w.toStringAsFixed(1)}(kg)',
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
} 