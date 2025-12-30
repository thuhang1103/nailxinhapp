// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'districts.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Districts {
  int? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get divisionType => throw _privateConstructorUsedError;
  String? get codename => throw _privateConstructorUsedError;
  int? get provinceCode => throw _privateConstructorUsedError;

  /// Create a copy of Districts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistrictsCopyWith<Districts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictsCopyWith<$Res> {
  factory $DistrictsCopyWith(Districts value, $Res Function(Districts) then) =
      _$DistrictsCopyWithImpl<$Res, Districts>;
  @useResult
  $Res call({
    int? code,
    String? name,
    String? divisionType,
    String? codename,
    int? provinceCode,
  });
}

/// @nodoc
class _$DistrictsCopyWithImpl<$Res, $Val extends Districts>
    implements $DistrictsCopyWith<$Res> {
  _$DistrictsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Districts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? provinceCode = freezed,
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
abstract class _$$DistrictsImplCopyWith<$Res>
    implements $DistrictsCopyWith<$Res> {
  factory _$$DistrictsImplCopyWith(
    _$DistrictsImpl value,
    $Res Function(_$DistrictsImpl) then,
  ) = __$$DistrictsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? code,
    String? name,
    String? divisionType,
    String? codename,
    int? provinceCode,
  });
}

/// @nodoc
class __$$DistrictsImplCopyWithImpl<$Res>
    extends _$DistrictsCopyWithImpl<$Res, _$DistrictsImpl>
    implements _$$DistrictsImplCopyWith<$Res> {
  __$$DistrictsImplCopyWithImpl(
    _$DistrictsImpl _value,
    $Res Function(_$DistrictsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Districts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? provinceCode = freezed,
  }) {
    return _then(
      _$DistrictsImpl(
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
        provinceCode: freezed == provinceCode
            ? _value.provinceCode
            : provinceCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$DistrictsImpl extends _Districts {
  const _$DistrictsImpl({
    this.code,
    this.name,
    this.divisionType,
    this.codename,
    this.provinceCode,
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
  final int? provinceCode;

  @override
  String toString() {
    return 'Districts(code: $code, name: $name, divisionType: $divisionType, codename: $codename, provinceCode: $provinceCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictsImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.divisionType, divisionType) ||
                other.divisionType == divisionType) &&
            (identical(other.codename, codename) ||
                other.codename == codename) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    name,
    divisionType,
    codename,
    provinceCode,
  );

  /// Create a copy of Districts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictsImplCopyWith<_$DistrictsImpl> get copyWith =>
      __$$DistrictsImplCopyWithImpl<_$DistrictsImpl>(this, _$identity);
}

abstract class _Districts extends Districts {
  const factory _Districts({
    final int? code,
    final String? name,
    final String? divisionType,
    final String? codename,
    final int? provinceCode,
  }) = _$DistrictsImpl;
  const _Districts._() : super._();

  @override
  int? get code;
  @override
  String? get name;
  @override
  String? get divisionType;
  @override
  String? get codename;
  @override
  int? get provinceCode;

  /// Create a copy of Districts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictsImplCopyWith<_$DistrictsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
