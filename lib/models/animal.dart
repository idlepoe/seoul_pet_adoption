import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal.freezed.dart';
part 'animal.g.dart';

@freezed
abstract class Animal with _$Animal {
  const factory Animal({
    required int seq,
    required String animalNm,
    required String animalSex,
    required String animalType,
    required String animalBreed,
    required String adoptStatus,
    required String fosterStatus,
    required String weightKg,
    required String animalBrithYmd,
    required String admissionDt,
    required String cont,
    required String movieUrl,
  }) = _Animal;

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);
} 