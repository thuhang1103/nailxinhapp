// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Ward {
  int? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get divisionType => throw _privateConstructorUsedError;
  String? get codename => throw _privateConstructorUsedError;
  int? get districtCode => throw _privateConstructorUsedError;

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WardCopyWith<Ward> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WardCopyWith<$Res> {
  factory $WardCopyWith(Ward value, $Res Function(Ward) then) =
      _$WardCopyWithImpl<$Res, Ward>;
  @useResult
  $Res call({
    int? code,
    String? name,
    String? divisionType,
    String? codename,
    int? districtCode,
  });
}

/// @nodoc
class _$WardCopyWithImpl<$Res, $Val extends Ward>
    implements $WardCopyWith<$Res> {
  _$WardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? districtCode = freezed,
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
abstract class _$$WardImplCopyWith<$Res> implements $WardCopyWith<$Res> {
  factory _$$WardImplCopyWith(
    _$WardImpl value,
    $Res Function(_$WardImpl) then,
  ) = __$$WardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? code,
    String? name,
    String? divisionType,
    String? codename,
    int? districtCode,
  });
}

/// @nodoc
class __$$WardImplCopyWithImpl<$Res>
    extends _$WardCopyWithImpl<$Res, _$WardImpl>
    implements _$$WardImplCopyWith<$Res> {
  __$$WardImplCopyWithImpl(_$WardImpl _value, $Res Function(_$WardImpl) _then)
    : super(_value, _then);

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? divisionType = freezed,
    Object? codename = freezed,
    Object? districtCode = freezed,
  }) {
    return _then(
      _$WardImpl(
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
        districtCode: freezed == districtCode
            ? _value.districtCode
            : districtCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$WardImpl extends _Ward {
  const _$WardImpl({
    this.code,
    this.name,
    this.divisionType,
    this.codename,
    this.districtCode,
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
  final int? districtCode;

  @override
  String toString() {
    return 'Ward(code: $code, name: $name, divisionType: $divisionType, codename: $codename, districtCode: $districtCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WardImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.divisionType, divisionType) ||
                other.divisionType == divisionType) &&
            (identical(other.codename, codename) ||
                other.codename == codename) &&
            (identical(other.districtCode, districtCode) ||
                other.districtCode == districtCode));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    name,
    divisionType,
    codename,
    districtCode,
  );

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WardImplCopyWith<_$WardImpl> get copyWith =>
      __$$WardImplCopyWithImpl<_$WardImpl>(this, _$identity);
}

abstract class _Ward extends Ward {
  const factory _Ward({
    final int? code,
    final String? name,
    final String? divisionType,
    final String? codename,
    final int? districtCode,
  }) = _$WardImpl;
  const _Ward._() : super._();

  @override
  int? get code;
  @override
  String? get name;
  @override
  String? get divisionType;
  @override
  String? get codename;
  @override
  int? get districtCode;

  /// Create a copy of Ward
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WardImplCopyWith<_$WardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
