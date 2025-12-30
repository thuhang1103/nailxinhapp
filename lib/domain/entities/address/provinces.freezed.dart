// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provinces.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Provinces {
  int? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get divisionType => throw _privateConstructorUsedError;
  String? get codename => throw _privateConstructorUsedError;
  int? get phoneCode => throw _privateConstructorUsedError;

  /// Create a copy of Provinces
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvincesCopyWith<Provinces> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvincesCopyWith<$Res> {
  factory $ProvincesCopyWith(Provinces value, $Res Function(Provinces) then) =
      _$ProvincesCopyWithImpl<$Res, Provinces>;
  @useResult
  $Res call({
    int? code,
    String? name,
    String? divisionType,
    String? codename,
    int? phoneCode,
  });
}

/// @nodoc
class _$ProvincesCopyWithImpl<$Res, $Val extends Provinces>
    implements $ProvincesCopyWith<$Res> {
  _$ProvincesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Provinces
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? phoneCode = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$ProvincesImplCopyWith<$Res>
    implements $ProvincesCopyWith<$Res> {
  factory _$$ProvincesImplCopyWith(
    _$ProvincesImpl value,
    $Res Function(_$ProvincesImpl) then,
  ) = __$$ProvincesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? code,
    String? name,
    String? divisionType,
    String? codename,
    int? phoneCode,
  });
}

/// @nodoc
class __$$ProvincesImplCopyWithImpl<$Res>
    extends _$ProvincesCopyWithImpl<$Res, _$ProvincesImpl>
    implements _$$ProvincesImplCopyWith<$Res> {
  __$$ProvincesImplCopyWithImpl(
    _$ProvincesImpl _value,
    $Res Function(_$ProvincesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Provinces
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? phoneCode = freezed,
  }) {
    return _then(
      _$ProvincesImpl(
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
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

class _$ProvincesImpl extends _Provinces {
  const _$ProvincesImpl({
    this.code,
    this.name,
    this.divisionType,
    this.codename,
    this.phoneCode,
  }) : super._();

  @override
  final int? code;
  @override
  final String? name;
  @override
  final String? divisionType;
  @override
  final String? codename;
  @override
  final int? phoneCode;

  @override
  String toString() {
    return 'Provinces(code: $code, name: $name, divisionType: $divisionType, codename: $codename, phoneCode: $phoneCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvincesImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.divisionType, divisionType) ||
                other.divisionType == divisionType) &&
            (identical(other.codename, codename) ||
                other.codename == codename) &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, divisionType, codename, phoneCode);

  /// Create a copy of Provinces
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvincesImplCopyWith<_$ProvincesImpl> get copyWith =>
      __$$ProvincesImplCopyWithImpl<_$ProvincesImpl>(this, _$identity);
}

abstract class _Provinces extends Provinces {
  const factory _Provinces({
    final int? code,
    final String? name,
    final String? divisionType,
    final String? codename,
    final int? phoneCode,
  }) = _$ProvincesImpl;
  const _Provinces._() : super._();

  @override
  int? get code;
  @override
  String? get name;
  @override
  String? get divisionType;
  @override
  String? get codename;
  @override
  int? get phoneCode;

  /// Create a copy of Provinces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvincesImplCopyWith<_$ProvincesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
