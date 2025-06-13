// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimalImpl _$$AnimalImplFromJson(Map<String, dynamic> json) => _$AnimalImpl(
      id: json['id'] as String,
      ANIMAL_NM: json['ANIMAL_NM'] as String,
      ANIMAL_TYPE: json['ANIMAL_TYPE'] as String,
      ANIMAL_BREED: json['ANIMAL_BREED'] as String,
      ANIMAL_SEX: json['ANIMAL_SEX'] as String,
      ANIMAL_BRITH_YMD: json['ANIMAL_BRITH_YMD'] as String,
      WEIGHT_KG: json['WEIGHT_KG'] as String,
      ADMISSION_DT: json['ADMISSION_DT'] as String,
      ADOPT_STATUS: json['ADOPT_STATUS'] as String,
      FOSTER_STATUS: json['FOSTER_STATUS'] as String,
      IMG_URL: json['IMG_URL'] as String,
      MOVIE_URL: json['MOVIE_URL'] as String,
      CONT: json['CONT'] as String,
      updatedAt: _timestampToDateTime(json['updatedAt']),
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AnimalImplToJson(_$AnimalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ANIMAL_NM': instance.ANIMAL_NM,
      'ANIMAL_TYPE': instance.ANIMAL_TYPE,
      'ANIMAL_BREED': instance.ANIMAL_BREED,
      'ANIMAL_SEX': instance.ANIMAL_SEX,
      'ANIMAL_BRITH_YMD': instance.ANIMAL_BRITH_YMD,
      'WEIGHT_KG': instance.WEIGHT_KG,
      'ADMISSION_DT': instance.ADMISSION_DT,
      'ADOPT_STATUS': instance.ADOPT_STATUS,
      'FOSTER_STATUS': instance.FOSTER_STATUS,
      'IMG_URL': instance.IMG_URL,
      'MOVIE_URL': instance.MOVIE_URL,
      'CONT': instance.CONT,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'viewCount': instance.viewCount,
    };
