// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Animal _$AnimalFromJson(Map<String, dynamic> json) {
  return _Animal.fromJson(json);
}

/// @nodoc
mixin _$Animal {
  String get id => throw _privateConstructorUsedError;
  String get ANIMAL_NM => throw _privateConstructorUsedError;
  String get ANIMAL_TYPE => throw _privateConstructorUsedError;
  String get ANIMAL_BREED => throw _privateConstructorUsedError;
  String get ANIMAL_SEX => throw _privateConstructorUsedError;
  String get ANIMAL_BRITH_YMD => throw _privateConstructorUsedError;
  String get WEIGHT_KG => throw _privateConstructorUsedError;
  String get ADMISSION_DT => throw _privateConstructorUsedError;
  String get ADOPT_STATUS => throw _privateConstructorUsedError;
  String get FOSTER_STATUS => throw _privateConstructorUsedError;
  String get IMG_URL => throw _privateConstructorUsedError;
  String get MOVIE_URL => throw _privateConstructorUsedError;
  String get CONT => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampToDateTime)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int get viewCount => throw _privateConstructorUsedError;

  /// Serializes this Animal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimalCopyWith<Animal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalCopyWith<$Res> {
  factory $AnimalCopyWith(Animal value, $Res Function(Animal) then) =
      _$AnimalCopyWithImpl<$Res, Animal>;
  @useResult
  $Res call(
      {String id,
      String ANIMAL_NM,
      String ANIMAL_TYPE,
      String ANIMAL_BREED,
      String ANIMAL_SEX,
      String ANIMAL_BRITH_YMD,
      String WEIGHT_KG,
      String ADMISSION_DT,
      String ADOPT_STATUS,
      String FOSTER_STATUS,
      String IMG_URL,
      String MOVIE_URL,
      String CONT,
      @JsonKey(fromJson: _timestampToDateTime) DateTime? updatedAt,
      int viewCount});
}

/// @nodoc
class _$AnimalCopyWithImpl<$Res, $Val extends Animal>
    implements $AnimalCopyWith<$Res> {
  _$AnimalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ANIMAL_NM = null,
    Object? ANIMAL_TYPE = null,
    Object? ANIMAL_BREED = null,
    Object? ANIMAL_SEX = null,
    Object? ANIMAL_BRITH_YMD = null,
    Object? WEIGHT_KG = null,
    Object? ADMISSION_DT = null,
    Object? ADOPT_STATUS = null,
    Object? FOSTER_STATUS = null,
    Object? IMG_URL = null,
    Object? MOVIE_URL = null,
    Object? CONT = null,
    Object? updatedAt = freezed,
    Object? viewCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_NM: null == ANIMAL_NM
          ? _value.ANIMAL_NM
          : ANIMAL_NM // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_TYPE: null == ANIMAL_TYPE
          ? _value.ANIMAL_TYPE
          : ANIMAL_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_BREED: null == ANIMAL_BREED
          ? _value.ANIMAL_BREED
          : ANIMAL_BREED // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_SEX: null == ANIMAL_SEX
          ? _value.ANIMAL_SEX
          : ANIMAL_SEX // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_BRITH_YMD: null == ANIMAL_BRITH_YMD
          ? _value.ANIMAL_BRITH_YMD
          : ANIMAL_BRITH_YMD // ignore: cast_nullable_to_non_nullable
              as String,
      WEIGHT_KG: null == WEIGHT_KG
          ? _value.WEIGHT_KG
          : WEIGHT_KG // ignore: cast_nullable_to_non_nullable
              as String,
      ADMISSION_DT: null == ADMISSION_DT
          ? _value.ADMISSION_DT
          : ADMISSION_DT // ignore: cast_nullable_to_non_nullable
              as String,
      ADOPT_STATUS: null == ADOPT_STATUS
          ? _value.ADOPT_STATUS
          : ADOPT_STATUS // ignore: cast_nullable_to_non_nullable
              as String,
      FOSTER_STATUS: null == FOSTER_STATUS
          ? _value.FOSTER_STATUS
          : FOSTER_STATUS // ignore: cast_nullable_to_non_nullable
              as String,
      IMG_URL: null == IMG_URL
          ? _value.IMG_URL
          : IMG_URL // ignore: cast_nullable_to_non_nullable
              as String,
      MOVIE_URL: null == MOVIE_URL
          ? _value.MOVIE_URL
          : MOVIE_URL // ignore: cast_nullable_to_non_nullable
              as String,
      CONT: null == CONT
          ? _value.CONT
          : CONT // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimalImplCopyWith<$Res> implements $AnimalCopyWith<$Res> {
  factory _$$AnimalImplCopyWith(
          _$AnimalImpl value, $Res Function(_$AnimalImpl) then) =
      __$$AnimalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ANIMAL_NM,
      String ANIMAL_TYPE,
      String ANIMAL_BREED,
      String ANIMAL_SEX,
      String ANIMAL_BRITH_YMD,
      String WEIGHT_KG,
      String ADMISSION_DT,
      String ADOPT_STATUS,
      String FOSTER_STATUS,
      String IMG_URL,
      String MOVIE_URL,
      String CONT,
      @JsonKey(fromJson: _timestampToDateTime) DateTime? updatedAt,
      int viewCount});
}

/// @nodoc
class __$$AnimalImplCopyWithImpl<$Res>
    extends _$AnimalCopyWithImpl<$Res, _$AnimalImpl>
    implements _$$AnimalImplCopyWith<$Res> {
  __$$AnimalImplCopyWithImpl(
      _$AnimalImpl _value, $Res Function(_$AnimalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ANIMAL_NM = null,
    Object? ANIMAL_TYPE = null,
    Object? ANIMAL_BREED = null,
    Object? ANIMAL_SEX = null,
    Object? ANIMAL_BRITH_YMD = null,
    Object? WEIGHT_KG = null,
    Object? ADMISSION_DT = null,
    Object? ADOPT_STATUS = null,
    Object? FOSTER_STATUS = null,
    Object? IMG_URL = null,
    Object? MOVIE_URL = null,
    Object? CONT = null,
    Object? updatedAt = freezed,
    Object? viewCount = null,
  }) {
    return _then(_$AnimalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_NM: null == ANIMAL_NM
          ? _value.ANIMAL_NM
          : ANIMAL_NM // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_TYPE: null == ANIMAL_TYPE
          ? _value.ANIMAL_TYPE
          : ANIMAL_TYPE // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_BREED: null == ANIMAL_BREED
          ? _value.ANIMAL_BREED
          : ANIMAL_BREED // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_SEX: null == ANIMAL_SEX
          ? _value.ANIMAL_SEX
          : ANIMAL_SEX // ignore: cast_nullable_to_non_nullable
              as String,
      ANIMAL_BRITH_YMD: null == ANIMAL_BRITH_YMD
          ? _value.ANIMAL_BRITH_YMD
          : ANIMAL_BRITH_YMD // ignore: cast_nullable_to_non_nullable
              as String,
      WEIGHT_KG: null == WEIGHT_KG
          ? _value.WEIGHT_KG
          : WEIGHT_KG // ignore: cast_nullable_to_non_nullable
              as String,
      ADMISSION_DT: null == ADMISSION_DT
          ? _value.ADMISSION_DT
          : ADMISSION_DT // ignore: cast_nullable_to_non_nullable
              as String,
      ADOPT_STATUS: null == ADOPT_STATUS
          ? _value.ADOPT_STATUS
          : ADOPT_STATUS // ignore: cast_nullable_to_non_nullable
              as String,
      FOSTER_STATUS: null == FOSTER_STATUS
          ? _value.FOSTER_STATUS
          : FOSTER_STATUS // ignore: cast_nullable_to_non_nullable
              as String,
      IMG_URL: null == IMG_URL
          ? _value.IMG_URL
          : IMG_URL // ignore: cast_nullable_to_non_nullable
              as String,
      MOVIE_URL: null == MOVIE_URL
          ? _value.MOVIE_URL
          : MOVIE_URL // ignore: cast_nullable_to_non_nullable
              as String,
      CONT: null == CONT
          ? _value.CONT
          : CONT // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimalImpl implements _Animal {
  const _$AnimalImpl(
      {required this.id,
      required this.ANIMAL_NM,
      required this.ANIMAL_TYPE,
      required this.ANIMAL_BREED,
      required this.ANIMAL_SEX,
      required this.ANIMAL_BRITH_YMD,
      required this.WEIGHT_KG,
      required this.ADMISSION_DT,
      required this.ADOPT_STATUS,
      required this.FOSTER_STATUS,
      required this.IMG_URL,
      required this.MOVIE_URL,
      required this.CONT,
      @JsonKey(fromJson: _timestampToDateTime) this.updatedAt,
      this.viewCount = 0});

  factory _$AnimalImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimalImplFromJson(json);

  @override
  final String id;
  @override
  final String ANIMAL_NM;
  @override
  final String ANIMAL_TYPE;
  @override
  final String ANIMAL_BREED;
  @override
  final String ANIMAL_SEX;
  @override
  final String ANIMAL_BRITH_YMD;
  @override
  final String WEIGHT_KG;
  @override
  final String ADMISSION_DT;
  @override
  final String ADOPT_STATUS;
  @override
  final String FOSTER_STATUS;
  @override
  final String IMG_URL;
  @override
  final String MOVIE_URL;
  @override
  final String CONT;
  @override
  @JsonKey(fromJson: _timestampToDateTime)
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final int viewCount;

  @override
  String toString() {
    return 'Animal(id: $id, ANIMAL_NM: $ANIMAL_NM, ANIMAL_TYPE: $ANIMAL_TYPE, ANIMAL_BREED: $ANIMAL_BREED, ANIMAL_SEX: $ANIMAL_SEX, ANIMAL_BRITH_YMD: $ANIMAL_BRITH_YMD, WEIGHT_KG: $WEIGHT_KG, ADMISSION_DT: $ADMISSION_DT, ADOPT_STATUS: $ADOPT_STATUS, FOSTER_STATUS: $FOSTER_STATUS, IMG_URL: $IMG_URL, MOVIE_URL: $MOVIE_URL, CONT: $CONT, updatedAt: $updatedAt, viewCount: $viewCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ANIMAL_NM, ANIMAL_NM) ||
                other.ANIMAL_NM == ANIMAL_NM) &&
            (identical(other.ANIMAL_TYPE, ANIMAL_TYPE) ||
                other.ANIMAL_TYPE == ANIMAL_TYPE) &&
            (identical(other.ANIMAL_BREED, ANIMAL_BREED) ||
                other.ANIMAL_BREED == ANIMAL_BREED) &&
            (identical(other.ANIMAL_SEX, ANIMAL_SEX) ||
                other.ANIMAL_SEX == ANIMAL_SEX) &&
            (identical(other.ANIMAL_BRITH_YMD, ANIMAL_BRITH_YMD) ||
                other.ANIMAL_BRITH_YMD == ANIMAL_BRITH_YMD) &&
            (identical(other.WEIGHT_KG, WEIGHT_KG) ||
                other.WEIGHT_KG == WEIGHT_KG) &&
            (identical(other.ADMISSION_DT, ADMISSION_DT) ||
                other.ADMISSION_DT == ADMISSION_DT) &&
            (identical(other.ADOPT_STATUS, ADOPT_STATUS) ||
                other.ADOPT_STATUS == ADOPT_STATUS) &&
            (identical(other.FOSTER_STATUS, FOSTER_STATUS) ||
                other.FOSTER_STATUS == FOSTER_STATUS) &&
            (identical(other.IMG_URL, IMG_URL) || other.IMG_URL == IMG_URL) &&
            (identical(other.MOVIE_URL, MOVIE_URL) ||
                other.MOVIE_URL == MOVIE_URL) &&
            (identical(other.CONT, CONT) || other.CONT == CONT) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ANIMAL_NM,
      ANIMAL_TYPE,
      ANIMAL_BREED,
      ANIMAL_SEX,
      ANIMAL_BRITH_YMD,
      WEIGHT_KG,
      ADMISSION_DT,
      ADOPT_STATUS,
      FOSTER_STATUS,
      IMG_URL,
      MOVIE_URL,
      CONT,
      updatedAt,
      viewCount);

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimalImplCopyWith<_$AnimalImpl> get copyWith =>
      __$$AnimalImplCopyWithImpl<_$AnimalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimalImplToJson(
      this,
    );
  }
}

abstract class _Animal implements Animal {
  const factory _Animal(
      {required final String id,
      required final String ANIMAL_NM,
      required final String ANIMAL_TYPE,
      required final String ANIMAL_BREED,
      required final String ANIMAL_SEX,
      required final String ANIMAL_BRITH_YMD,
      required final String WEIGHT_KG,
      required final String ADMISSION_DT,
      required final String ADOPT_STATUS,
      required final String FOSTER_STATUS,
      required final String IMG_URL,
      required final String MOVIE_URL,
      required final String CONT,
      @JsonKey(fromJson: _timestampToDateTime) final DateTime? updatedAt,
      final int viewCount}) = _$AnimalImpl;

  factory _Animal.fromJson(Map<String, dynamic> json) = _$AnimalImpl.fromJson;

  @override
  String get id;
  @override
  String get ANIMAL_NM;
  @override
  String get ANIMAL_TYPE;
  @override
  String get ANIMAL_BREED;
  @override
  String get ANIMAL_SEX;
  @override
  String get ANIMAL_BRITH_YMD;
  @override
  String get WEIGHT_KG;
  @override
  String get ADMISSION_DT;
  @override
  String get ADOPT_STATUS;
  @override
  String get FOSTER_STATUS;
  @override
  String get IMG_URL;
  @override
  String get MOVIE_URL;
  @override
  String get CONT;
  @override
  @JsonKey(fromJson: _timestampToDateTime)
  DateTime? get updatedAt;
  @override
  int get viewCount;

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimalImplCopyWith<_$AnimalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
