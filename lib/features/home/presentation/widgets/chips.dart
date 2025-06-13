import 'package:flutter/material.dart';

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

class WeightChip extends StatelessWidget {
  final String weight;
  const WeightChip(this.weight);

  @override
  Widget build(BuildContext context) {
    double w = double.tryParse(weight.replaceAll(RegExp(r'[^0-9\\.]'), '')) ?? 0;
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

class DefaultChip extends StatelessWidget {
  final String value;
  const DefaultChip(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final String label;
  final Widget child;
  const InfoChip({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        child,
      ],
    );
  }
} 