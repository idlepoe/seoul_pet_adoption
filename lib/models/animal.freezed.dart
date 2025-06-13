// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Animal {
  int get seq;
  String get animalNm;
  String get animalSex;
  String get animalType;
  String get animalBreed;
  String get adoptStatus;
  String get fosterStatus;
  String get weightKg;
  String get animalBrithYmd;
  String get admissionDt;
  String get cont;
  String get movieUrl;

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnimalCopyWith<Animal> get copyWith =>
      _$AnimalCopyWithImpl<Animal>(this as Animal, _$identity);

  /// Serializes this Animal to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Animal &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.animalNm, animalNm) ||
                other.animalNm == animalNm) &&
            (identical(other.animalSex, animalSex) ||
                other.animalSex == animalSex) &&
            (identical(other.animalType, animalType) ||
                other.animalType == animalType) &&
            (identical(other.animalBreed, animalBreed) ||
                other.animalBreed == animalBreed) &&
            (identical(other.adoptStatus, adoptStatus) ||
                other.adoptStatus == adoptStatus) &&
            (identical(other.fosterStatus, fosterStatus) ||
                other.fosterStatus == fosterStatus) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.animalBrithYmd, animalBrithYmd) ||
                other.animalBrithYmd == animalBrithYmd) &&
            (identical(other.admissionDt, admissionDt) ||
                other.admissionDt == admissionDt) &&
            (identical(other.cont, cont) || other.cont == cont) &&
            (identical(other.movieUrl, movieUrl) ||
                other.movieUrl == movieUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      seq,
      animalNm,
      animalSex,
      animalType,
      animalBreed,
      adoptStatus,
      fosterStatus,
      weightKg,
      animalBrithYmd,
      admissionDt,
      cont,
      movieUrl);

  @override
  String toString() {
    return 'Animal(seq: $seq, animalNm: $animalNm, animalSex: $animalSex, animalType: $animalType, animalBreed: $animalBreed, adoptStatus: $adoptStatus, fosterStatus: $fosterStatus, weightKg: $weightKg, animalBrithYmd: $animalBrithYmd, admissionDt: $admissionDt, cont: $cont, movieUrl: $movieUrl)';
  }
}

/// @nodoc
abstract mixin class $AnimalCopyWith<$Res> {
  factory $AnimalCopyWith(Animal value, $Res Function(Animal) _then) =
      _$AnimalCopyWithImpl;
  @useResult
  $Res call(
      {int seq,
      String animalNm,
      String animalSex,
      String animalType,
      String animalBreed,
      String adoptStatus,
      String fosterStatus,
      String weightKg,
      String animalBrithYmd,
      String admissionDt,
      String cont,
      String movieUrl});
}

/// @nodoc
class _$AnimalCopyWithImpl<$Res> implements $AnimalCopyWith<$Res> {
  _$AnimalCopyWithImpl(this._self, this._then);

  final Animal _self;
  final $Res Function(Animal) _then;

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = null,
    Object? animalNm = null,
    Object? animalSex = null,
    Object? animalType = null,
    Object? animalBreed = null,
    Object? adoptStatus = null,
    Object? fosterStatus = null,
    Object? weightKg = null,
    Object? animalBrithYmd = null,
    Object? admissionDt = null,
    Object? cont = null,
    Object? movieUrl = null,
  }) {
    return _then(_self.copyWith(
      seq: null == seq
          ? _self.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      animalNm: null == animalNm
          ? _self.animalNm
          : animalNm // ignore: cast_nullable_to_non_nullable
              as String,
      animalSex: null == animalSex
          ? _self.animalSex
          : animalSex // ignore: cast_nullable_to_non_nullable
              as String,
      animalType: null == animalType
          ? _self.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String,
      animalBreed: null == animalBreed
          ? _self.animalBreed
          : animalBreed // ignore: cast_nullable_to_non_nullable
              as String,
      adoptStatus: null == adoptStatus
          ? _self.adoptStatus
          : adoptStatus // ignore: cast_nullable_to_non_nullable
              as String,
      fosterStatus: null == fosterStatus
          ? _self.fosterStatus
          : fosterStatus // ignore: cast_nullable_to_non_nullable
              as String,
      weightKg: null == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as String,
      animalBrithYmd: null == animalBrithYmd
          ? _self.animalBrithYmd
          : animalBrithYmd // ignore: cast_nullable_to_non_nullable
              as String,
      admissionDt: null == admissionDt
          ? _self.admissionDt
          : admissionDt // ignore: cast_nullable_to_non_nullable
              as String,
      cont: null == cont
          ? _self.cont
          : cont // ignore: cast_nullable_to_non_nullable
              as String,
      movieUrl: null == movieUrl
          ? _self.movieUrl
          : movieUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Animal implements Animal {
  const _Animal(
      {required this.seq,
      required this.animalNm,
      required this.animalSex,
      required this.animalType,
      required this.animalBreed,
      required this.adoptStatus,
      required this.fosterStatus,
      required this.weightKg,
      required this.animalBrithYmd,
      required this.admissionDt,
      required this.cont,
      required this.movieUrl});
  factory _Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);

  @override
  final int seq;
  @override
  final String animalNm;
  @override
  final String animalSex;
  @override
  final String animalType;
  @override
  final String animalBreed;
  @override
  final String adoptStatus;
  @override
  final String fosterStatus;
  @override
  final String weightKg;
  @override
  final String animalBrithYmd;
  @override
  final String admissionDt;
  @override
  final String cont;
  @override
  final String movieUrl;

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnimalCopyWith<_Animal> get copyWith =>
      __$AnimalCopyWithImpl<_Animal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnimalToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Animal &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.animalNm, animalNm) ||
                other.animalNm == animalNm) &&
            (identical(other.animalSex, animalSex) ||
                other.animalSex == animalSex) &&
            (identical(other.animalType, animalType) ||
                other.animalType == animalType) &&
            (identical(other.animalBreed, animalBreed) ||
                other.animalBreed == animalBreed) &&
            (identical(other.adoptStatus, adoptStatus) ||
                other.adoptStatus == adoptStatus) &&
            (identical(other.fosterStatus, fosterStatus) ||
                other.fosterStatus == fosterStatus) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.animalBrithYmd, animalBrithYmd) ||
                other.animalBrithYmd == animalBrithYmd) &&
            (identical(other.admissionDt, admissionDt) ||
                other.admissionDt == admissionDt) &&
            (identical(other.cont, cont) || other.cont == cont) &&
            (identical(other.movieUrl, movieUrl) ||
                other.movieUrl == movieUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      seq,
      animalNm,
      animalSex,
      animalType,
      animalBreed,
      adoptStatus,
      fosterStatus,
      weightKg,
      animalBrithYmd,
      admissionDt,
      cont,
      movieUrl);

  @override
  String toString() {
    return 'Animal(seq: $seq, animalNm: $animalNm, animalSex: $animalSex, animalType: $animalType, animalBreed: $animalBreed, adoptStatus: $adoptStatus, fosterStatus: $fosterStatus, weightKg: $weightKg, animalBrithYmd: $animalBrithYmd, admissionDt: $admissionDt, cont: $cont, movieUrl: $movieUrl)';
  }
}

/// @nodoc
abstract mixin class _$AnimalCopyWith<$Res> implements $AnimalCopyWith<$Res> {
  factory _$AnimalCopyWith(_Animal value, $Res Function(_Animal) _then) =
      __$AnimalCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int seq,
      String animalNm,
      String animalSex,
      String animalType,
      String animalBreed,
      String adoptStatus,
      String fosterStatus,
      String weightKg,
      String animalBrithYmd,
      String admissionDt,
      String cont,
      String movieUrl});
}

/// @nodoc
class __$AnimalCopyWithImpl<$Res> implements _$AnimalCopyWith<$Res> {
  __$AnimalCopyWithImpl(this._self, this._then);

  final _Animal _self;
  final $Res Function(_Animal) _then;

  /// Create a copy of Animal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? seq = null,
    Object? animalNm = null,
    Object? animalSex = null,
    Object? animalType = null,
    Object? animalBreed = null,
    Object? adoptStatus = null,
    Object? fosterStatus = null,
    Object? weightKg = null,
    Object? animalBrithYmd = null,
    Object? admissionDt = null,
    Object? cont = null,
    Object? movieUrl = null,
  }) {
    return _then(_Animal(
      seq: null == seq
          ? _self.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      animalNm: null == animalNm
          ? _self.animalNm
          : animalNm // ignore: cast_nullable_to_non_nullable
              as String,
      animalSex: null == animalSex
          ? _self.animalSex
          : animalSex // ignore: cast_nullable_to_non_nullable
              as String,
      animalType: null == animalType
          ? _self.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String,
      animalBreed: null == animalBreed
          ? _self.animalBreed
          : animalBreed // ignore: cast_nullable_to_non_nullable
              as String,
      adoptStatus: null == adoptStatus
          ? _self.adoptStatus
          : adoptStatus // ignore: cast_nullable_to_non_nullable
              as String,
      fosterStatus: null == fosterStatus
          ? _self.fosterStatus
          : fosterStatus // ignore: cast_nullable_to_non_nullable
              as String,
      weightKg: null == weightKg
          ? _self.weightKg
          : weightKg // ignore: cast_nullable_to_non_nullable
              as String,
      animalBrithYmd: null == animalBrithYmd
          ? _self.animalBrithYmd
          : animalBrithYmd // ignore: cast_nullable_to_non_nullable
              as String,
      admissionDt: null == admissionDt
          ? _self.admissionDt
          : admissionDt // ignore: cast_nullable_to_non_nullable
              as String,
      cont: null == cont
          ? _self.cont
          : cont // ignore: cast_nullable_to_non_nullable
              as String,
      movieUrl: null == movieUrl
          ? _self.movieUrl
          : movieUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
