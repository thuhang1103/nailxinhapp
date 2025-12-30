// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) {
  return _DistrictModel.fromJson(json);
}

/// @nodoc
mixin _$DistrictModel {
  @JsonKey(name: 'name')
  String? get districtName => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int? get districtID => throw _privateConstructorUsedError;
  @JsonKey(name: 'division_type')
  String? get divisionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'codename')
  String? get codename => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_code')
  int? get provinceCode => throw _privateConstructorUsedError;

  /// Serializes this DistrictModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistrictModelCopyWith<DistrictModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictModelCopyWith<$Res> {
  factory $DistrictModelCopyWith(
    DistrictModel value,
    $Res Function(DistrictModel) then,
  ) = _$DistrictModelCopyWithImpl<$Res, DistrictModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'name') String? districtName,
    @JsonKey(name: 'code') int? districtID,
    @JsonKey(name: 'division_type') String? divisionType,
    @JsonKey(name: 'codename') String? codename,
    @JsonKey(name: 'province_code') int? provinceCode,
  });
}

/// @nodoc
class _$DistrictModelCopyWithImpl<$Res, $Val extends DistrictModel>
    implements $DistrictModelCopyWith<$Res> {
  _$DistrictModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtName = freezed,
    Object? districtID = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? provinceCode = freezed,
  }) {
    return _then(
      _value.copyWith(
            districtName: freezed == districtName
                ? _value.districtName
                : districtName // ignore: cast_nullable_to_non_nullable
                      as String?,
            districtID: freezed == districtID
                ? _value.districtID
                : districtID // ignore: cast_nullable_to_non_nullable
                      as int?,
            divisionType: freezed == divisionType
                ? _value.divisionType
                : divisionType // ignore: cast_nullable_to_non_nullable
                      as String?,
            codename: freezed == codename
                ? _value.codename
                : codename // ignore: cast_nullable_to_non_nullable
                      as String?,
            provinceCode: freezed == provinceCode
                ? _value.provinceCode
                : provinceCode // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DistrictModelImplCopyWith<$Res>
    implements $DistrictModelCopyWith<$Res> {
  factory _$$DistrictModelImplCopyWith(
    _$DistrictModelImpl value,
    $Res Function(_$DistrictModelImpl) then,
  ) = __$$DistrictModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'name') String? districtName,
    @JsonKey(name: 'code') int? districtID,
    @JsonKey(name: 'division_type') String? divisionType,
    @JsonKey(name: 'codename') String? codename,
    @JsonKey(name: 'province_code') int? provinceCode,
  });
}

/// @nodoc
class __$$DistrictModelImplCopyWithImpl<$Res>
    extends _$DistrictModelCopyWithImpl<$Res, _$DistrictModelImpl>
    implements _$$DistrictModelImplCopyWith<$Res> {
  __$$DistrictModelImplCopyWithImpl(
    _$DistrictModelImpl _value,
    $Res Function(_$DistrictModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtName = freezed,
    Object? districtID = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? provinceCode = freezed,
  }) {
    return _then(
      _$DistrictModelImpl(
        districtName: freezed == districtName
            ? _value.districtName
            : districtName // ignore: cast_nullable_to_non_nullable
                  as String?,
        districtID: freezed == districtID
            ? _value.districtID
            : districtID // ignore: cast_nullable_to_non_nullable
                  as int?,
        divisionType: freezed == divisionType
            ? _value.divisionType
            : divisionType // ignore: cast_nullable_to_non_nullable
                  as String?,
        codename: freezed == codename
            ? _value.codename
            : codename // ignore: cast_nullable_to_non_nullable
                  as String?,
        provinceCode: freezed == provinceCode
            ? _value.provinceCode
            : provinceCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DistrictModelImpl extends _DistrictModel {
  const _$DistrictModelImpl({
    @JsonKey(name: 'name') this.districtName,
    @JsonKey(name: 'code') this.districtID,
    @JsonKey(name: 'division_type') this.divisionType,
    @JsonKey(name: 'codename') this.codename,
    @JsonKey(name: 'province_code') this.provinceCode,
  }) : super._();

  factory _$DistrictModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? districtName;
  @override
  @JsonKey(name: 'code')
  final int? districtID;
  @override
  @JsonKey(name: 'division_type')
  final String? divisionType;
  @override
  @JsonKey(name: 'codename')
  final String? codename;
  @override
  @JsonKey(name: 'province_code')
  final int? provinceCode;

  @override
  String toString() {
    return 'DistrictModel(districtName: $districtName, districtID: $districtID, divisionType: $divisionType, codename: $codename, provinceCode: $provinceCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictModelImpl &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.districtID, districtID) ||
                other.districtID == districtID) &&
            (identical(other.divisionType, divisionType) ||
                other.divisionType == divisionType) &&
            (identical(other.codename, codename) ||
                other.codename == codename) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    districtName,
    districtID,
    divisionType,
    codename,
    provinceCode,
  );

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictModelImplCopyWith<_$DistrictModelImpl> get copyWith =>
      __$$DistrictModelImplCopyWithImpl<_$DistrictModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictModelImplToJson(this);
  }
}

abstract class _DistrictModel extends DistrictModel {
  const factory _DistrictModel({
    @JsonKey(name: 'name') final String? districtName,
    @JsonKey(name: 'code') final int? districtID,
    @JsonKey(name: 'division_type') final String? divisionType,
    @JsonKey(name: 'codename') final String? codename,
    @JsonKey(name: 'province_code') final int? provinceCode,
  }) = _$DistrictModelImpl;
  const _DistrictModel._() : super._();

  factory _DistrictModel.fromJson(Map<String, dynamic> json) =
      _$DistrictModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get districtName;
  @override
  @JsonKey(name: 'code')
  int? get districtID;
  @override
  @JsonKey(name: 'division_type')
  String? get divisionType;
  @override
  @JsonKey(name: 'codename')
  String? get codename;
  @override
  @JsonKey(name: 'province_code')
  int? get provinceCode;

  /// Create a copy of DistrictModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictModelImplCopyWith<_$DistrictModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
