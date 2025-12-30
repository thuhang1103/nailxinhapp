// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ward_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WardModel _$WardModelFromJson(Map<String, dynamic> json) {
  return _WardModel.fromJson(json);
}

/// @nodoc
mixin _$WardModel {
  @JsonKey(name: 'name')
  String? get wardName => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int? get wardID => throw _privateConstructorUsedError;
  @JsonKey(name: 'division_type')
  String? get divisionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'codename')
  String? get codename => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_code')
  int? get districtCode => throw _privateConstructorUsedError;

  /// Serializes this WardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WardModelCopyWith<WardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WardModelCopyWith<$Res> {
  factory $WardModelCopyWith(WardModel value, $Res Function(WardModel) then) =
      _$WardModelCopyWithImpl<$Res, WardModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'name') String? wardName,
    @JsonKey(name: 'code') int? wardID,
    @JsonKey(name: 'division_type') String? divisionType,
    @JsonKey(name: 'codename') String? codename,
    @JsonKey(name: 'district_code') int? districtCode,
  });
}

/// @nodoc
class _$WardModelCopyWithImpl<$Res, $Val extends WardModel>
    implements $WardModelCopyWith<$Res> {
  _$WardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wardName = freezed,
    Object? wardID = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? districtCode = freezed,
  }) {
    return _then(
      _value.copyWith(
            wardName: freezed == wardName
                ? _value.wardName
                : wardName // ignore: cast_nullable_to_non_nullable
                      as String?,
            wardID: freezed == wardID
                ? _value.wardID
                : wardID // ignore: cast_nullable_to_non_nullable
                      as int?,
            divisionType: freezed == divisionType
                ? _value.divisionType
                : divisionType // ignore: cast_nullable_to_non_nullable
                      as String?,
            codename: freezed == codename
                ? _value.codename
                : codename // ignore: cast_nullable_to_non_nullable
                      as String?,
            districtCode: freezed == districtCode
                ? _value.districtCode
                : districtCode // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WardModelImplCopyWith<$Res>
    implements $WardModelCopyWith<$Res> {
  factory _$$WardModelImplCopyWith(
    _$WardModelImpl value,
    $Res Function(_$WardModelImpl) then,
  ) = __$$WardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'name') String? wardName,
    @JsonKey(name: 'code') int? wardID,
    @JsonKey(name: 'division_type') String? divisionType,
    @JsonKey(name: 'codename') String? codename,
    @JsonKey(name: 'district_code') int? districtCode,
  });
}

/// @nodoc
class __$$WardModelImplCopyWithImpl<$Res>
    extends _$WardModelCopyWithImpl<$Res, _$WardModelImpl>
    implements _$$WardModelImplCopyWith<$Res> {
  __$$WardModelImplCopyWithImpl(
    _$WardModelImpl _value,
    $Res Function(_$WardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wardName = freezed,
    Object? wardID = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? districtCode = freezed,
  }) {
    return _then(
      _$WardModelImpl(
        wardName: freezed == wardName
            ? _value.wardName
            : wardName // ignore: cast_nullable_to_non_nullable
                  as String?,
        wardID: freezed == wardID
            ? _value.wardID
            : wardID // ignore: cast_nullable_to_non_nullable
                  as int?,
        divisionType: freezed == divisionType
            ? _value.divisionType
            : divisionType // ignore: cast_nullable_to_non_nullable
                  as String?,
        codename: freezed == codename
            ? _value.codename
            : codename // ignore: cast_nullable_to_non_nullable
                  as String?,
        districtCode: freezed == districtCode
            ? _value.districtCode
            : districtCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WardModelImpl extends _WardModel {
  const _$WardModelImpl({
    @JsonKey(name: 'name') this.wardName,
    @JsonKey(name: 'code') this.wardID,
    @JsonKey(name: 'division_type') this.divisionType,
    @JsonKey(name: 'codename') this.codename,
    @JsonKey(name: 'district_code') this.districtCode,
  }) : super._();

  factory _$WardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WardModelImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? wardName;
  @override
  @JsonKey(name: 'code')
  final int? wardID;
  @override
  @JsonKey(name: 'division_type')
  final String? divisionType;
  @override
  @JsonKey(name: 'codename')
  final String? codename;
  @override
  @JsonKey(name: 'district_code')
  final int? districtCode;

  @override
  String toString() {
    return 'WardModel(wardName: $wardName, wardID: $wardID, divisionType: $divisionType, codename: $codename, districtCode: $districtCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WardModelImpl &&
            (identical(other.wardName, wardName) ||
                other.wardName == wardName) &&
            (identical(other.wardID, wardID) || other.wardID == wardID) &&
            (identical(other.divisionType, divisionType) ||
                other.divisionType == divisionType) &&
            (identical(other.codename, codename) ||
                other.codename == codename) &&
            (identical(other.districtCode, districtCode) ||
                other.districtCode == districtCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    wardName,
    wardID,
    divisionType,
    codename,
    districtCode,
  );

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WardModelImplCopyWith<_$WardModelImpl> get copyWith =>
      __$$WardModelImplCopyWithImpl<_$WardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WardModelImplToJson(this);
  }
}

abstract class _WardModel extends WardModel {
  const factory _WardModel({
    @JsonKey(name: 'name') final String? wardName,
    @JsonKey(name: 'code') final int? wardID,
    @JsonKey(name: 'division_type') final String? divisionType,
    @JsonKey(name: 'codename') final String? codename,
    @JsonKey(name: 'district_code') final int? districtCode,
  }) = _$WardModelImpl;
  const _WardModel._() : super._();

  factory _WardModel.fromJson(Map<String, dynamic> json) =
      _$WardModelImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get wardName;
  @override
  @JsonKey(name: 'code')
  int? get wardID;
  @override
  @JsonKey(name: 'division_type')
  String? get divisionType;
  @override
  @JsonKey(name: 'codename')
  String? get codename;
  @override
  @JsonKey(name: 'district_code')
  int? get districtCode;

  /// Create a copy of WardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WardModelImplCopyWith<_$WardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
