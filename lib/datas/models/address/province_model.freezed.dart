// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'province_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProvinceModel _$ProvinceModelFromJson(Map<String, dynamic> json) {
  return _ProvinceModel.fromJson(json);
}

/// @nodoc
mixin _$ProvinceModel {
  @JsonKey(name: 'name')
  String? get provinceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int? get provinceID => throw _privateConstructorUsedError;
  @JsonKey(name: 'division_type')
  String? get divisionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'codename')
  String? get codename => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_code')
  int? get phoneCode => throw _privateConstructorUsedError;

  /// Serializes this ProvinceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProvinceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvinceModelCopyWith<ProvinceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceModelCopyWith<$Res> {
  factory $ProvinceModelCopyWith(
    ProvinceModel value,
    $Res Function(ProvinceModel) then,
  ) = _$ProvinceModelCopyWithImpl<$Res, ProvinceModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'name') String? provinceName,
    @JsonKey(name: 'code') int? provinceID,
    @JsonKey(name: 'division_type') String? divisionType,
    @JsonKey(name: 'codename') String? codename,
    @JsonKey(name: 'phone_code') int? phoneCode,
  });
}

/// @nodoc
class _$ProvinceModelCopyWithImpl<$Res, $Val extends ProvinceModel>
    implements $ProvinceModelCopyWith<$Res> {
  _$ProvinceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProvinceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceName = freezed,
    Object? provinceID = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? phoneCode = freezed,
  }) {
    return _then(
      _value.copyWith(
            provinceName: freezed == provinceName
                ? _value.provinceName
                : provinceName // ignore: cast_nullable_to_non_nullable
                      as String?,
            provinceID: freezed == provinceID
                ? _value.provinceID
                : provinceID // ignore: cast_nullable_to_non_nullable
                      as int?,
            divisionType: freezed == divisionType
                ? _value.divisionType
                : divisionType // ignore: cast_nullable_to_non_nullable
                      as String?,
            codename: freezed == codename
                ? _value.codename
                : codename // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneCode: freezed == phoneCode
                ? _value.phoneCode
                : phoneCode // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProvinceModelImplCopyWith<$Res>
    implements $ProvinceModelCopyWith<$Res> {
  factory _$$ProvinceModelImplCopyWith(
    _$ProvinceModelImpl value,
    $Res Function(_$ProvinceModelImpl) then,
  ) = __$$ProvinceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'name') String? provinceName,
    @JsonKey(name: 'code') int? provinceID,
    @JsonKey(name: 'division_type') String? divisionType,
    @JsonKey(name: 'codename') String? codename,
    @JsonKey(name: 'phone_code') int? phoneCode,
  });
}

/// @nodoc
class __$$ProvinceModelImplCopyWithImpl<$Res>
    extends _$ProvinceModelCopyWithImpl<$Res, _$ProvinceModelImpl>
    implements _$$ProvinceModelImplCopyWith<$Res> {
  __$$ProvinceModelImplCopyWithImpl(
    _$ProvinceModelImpl _value,
    $Res Function(_$ProvinceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProvinceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceName = freezed,
    Object? provinceID = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? phoneCode = freezed,
  }) {
    return _then(
      _$ProvinceModelImpl(
        provinceName: freezed == provinceName
            ? _value.provinceName
            : provinceName // ignore: cast_nullable_to_non_nullable
                  as String?,
        provinceID: freezed == provinceID
            ? _value.provinceID
            : provinceID // ignore: cast_nullable_to_non_nullable
                  as int?,
        divisionType: freezed == divisionType
            ? _value.divisionType
            : divisionType // ignore: cast_nullable_to_non_nullable
                  as String?,
        codename: freezed == codename
            ? _value.codename
            : codename // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneCode: freezed == phoneCode
            ? _value.phoneCode
            : phoneCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvinceModelImpl extends _ProvinceModel {
  const _$ProvinceModelImpl({
    @JsonKey(name: 'name') this.provinceName,
    @JsonKey(name: 'code') this.provinceID,
    @JsonKey(name: 'division_type') this.divisionType,
    @JsonKey(name: 'codename') this.codename,
    @JsonKey(name: 'phone_code') this.phoneCode,
  }) : super._();

  factory _$ProvinceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvinceModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? provinceName;
  @override
  @JsonKey(name: 'code')
  final int? provinceID;
  @override
  @JsonKey(name: 'division_type')
  final String? divisionType;
  @override
  @JsonKey(name: 'codename')
  final String? codename;
  @override
  @JsonKey(name: 'phone_code')
  final int? phoneCode;

  @override
  String toString() {
    return 'ProvinceModel(provinceName: $provinceName, provinceID: $provinceID, divisionType: $divisionType, codename: $codename, phoneCode: $phoneCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceModelImpl &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.provinceID, provinceID) ||
                other.provinceID == provinceID) &&
            (identical(other.divisionType, divisionType) ||
                other.divisionType == divisionType) &&
            (identical(other.codename, codename) ||
                other.codename == codename) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    provinceName,
    provinceID,
    divisionType,
    codename,
    phoneCode,
  );

  /// Create a copy of ProvinceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceModelImplCopyWith<_$ProvinceModelImpl> get copyWith =>
      __$$ProvinceModelImplCopyWithImpl<_$ProvinceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvinceModelImplToJson(this);
  }
}

abstract class _ProvinceModel extends ProvinceModel {
  const factory _ProvinceModel({
    @JsonKey(name: 'name') final String? provinceName,
    @JsonKey(name: 'code') final int? provinceID,
    @JsonKey(name: 'division_type') final String? divisionType,
    @JsonKey(name: 'codename') final String? codename,
    @JsonKey(name: 'phone_code') final int? phoneCode,
  }) = _$ProvinceModelImpl;
  const _ProvinceModel._() : super._();

  factory _ProvinceModel.fromJson(Map<String, dynamic> json) =
      _$ProvinceModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get provinceName;
  @override
  @JsonKey(name: 'code')
  int? get provinceID;
  @override
  @JsonKey(name: 'division_type')
  String? get divisionType;
  @override
  @JsonKey(name: 'codename')
  String? get codename;
  @override
  @JsonKey(name: 'phone_code')
  int? get phoneCode;

  /// Create a copy of ProvinceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceModelImplCopyWith<_$ProvinceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
