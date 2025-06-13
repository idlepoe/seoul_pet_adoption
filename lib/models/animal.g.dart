// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Animal _$AnimalFromJson(Map<String, dynamic> json) => _Animal(
      seq: (json['seq'] as num).toInt(),
      animalNm: json['animalNm'] as String,
      animalSex: json['animalSex'] as String,
      animalType: json['animalType'] as String,
      animalBreed: json['animalBreed'] as String,
      adoptStatus: json['adoptStatus'] as String,
      fosterStatus: json['fosterStatus'] as String,
      weightKg: json['weightKg'] as String,
      animalBrithYmd: json['animalBrithYmd'] as String,
      admissionDt: json['admissionDt'] as String,
      cont: json['cont'] as String,
      movieUrl: json['movieUrl'] as String,
    );

Map<String, dynamic> _$AnimalToJson(_Animal instance) => <String, dynamic>{
      'seq': instance.seq,
      'animalNm': instance.animalNm,
      'animalSex': instance.animalSex,
      'animalType': instance.animalType,
      'animalBreed': instance.animalBreed,
      'adoptStatus': instance.adoptStatus,
      'fosterStatus': instance.fosterStatus,
      'weightKg': instance.weightKg,
      'animalBrithYmd': instance.animalBrithYmd,
      'admissionDt': instance.admissionDt,
      'cont': instance.cont,
      'movieUrl': instance.movieUrl,
    };
