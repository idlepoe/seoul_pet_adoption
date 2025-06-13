import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal.freezed.dart';
part 'animal.g.dart';

DateTime? _timestampToDateTime(dynamic json) {
  if (json == null) return null;
  if (json is DateTime) return json;
  if (json is Map && json.containsKey('_seconds')) {
    return DateTime.fromMillisecondsSinceEpoch((json['_seconds'] as int) * 1000);
  }
  return null;
}

@freezed
class Animal with _$Animal {
  const factory Animal({
    required String id,
    required String ANIMAL_NM,
    required String ANIMAL_TYPE,
    required String ANIMAL_BREED,
    required String ANIMAL_SEX,
    required String ANIMAL_BRITH_YMD,
    required String WEIGHT_KG,
    required String ADMISSION_DT,
    required String ADOPT_STATUS,
    required String FOSTER_STATUS,
    required String IMG_URL,
    required String MOVIE_URL,
    required String CONT,
    @JsonKey(fromJson: _timestampToDateTime) DateTime? updatedAt,
    @Default(0) int viewCount,
  }) = _Animal;

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);
} 