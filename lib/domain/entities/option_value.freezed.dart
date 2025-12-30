// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OptionValue {
  int? get valueID => throw _privateConstructorUsedError;
  int? get optionID => throw _privateConstructorUsedError;
  String? get valueName => throw _privateConstructorUsedError;

  /// Create a copy of OptionValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionValueCopyWith<OptionValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionValueCopyWith<$Res> {
  factory $OptionValueCopyWith(
    OptionValue value,
    $Res Function(OptionValue) then,
  ) = _$OptionValueCopyWithImpl<$Res, OptionValue>;
  @useResult
  $Res call({int? valueID, int? optionID, String? valueName});
}

/// @nodoc
class _$OptionValueCopyWithImpl<$Res, $Val extends OptionValue>
    implements $OptionValueCopyWith<$Res> {
  _$OptionValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptionValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueID = freezed,
    Object? optionID = freezed,
    Object? valueName = freezed,
  }) {
    return _then(
      _value.copyWith(
            valueID: freezed == valueID
                ? _value.valueID
                : valueID // ignore: cast_nullable_to_non_nullable
                      as int?,
            optionID: freezed == optionID
                ? _value.optionID
                : optionID // ignore: cast_nullable_to_non_nullable
                      as int?,
            valueName: freezed == valueName
                ? _value.valueName
                : valueName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OptionValueImplCopyWith<$Res>
    implements $OptionValueCopyWith<$Res> {
  factory _$$OptionValueImplCopyWith(
    _$OptionValueImpl value,
    $Res Function(_$OptionValueImpl) then,
  ) = __$$OptionValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? valueID, int? optionID, String? valueName});
}

/// @nodoc
class __$$OptionValueImplCopyWithImpl<$Res>
    extends _$OptionValueCopyWithImpl<$Res, _$OptionValueImpl>
    implements _$$OptionValueImplCopyWith<$Res> {
  __$$OptionValueImplCopyWithImpl(
    _$OptionValueImpl _value,
    $Res Function(_$OptionValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OptionValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueID = freezed,
    Object? optionID = freezed,
    Object? valueName = freezed,
  }) {
    return _then(
      _$OptionValueImpl(
        valueID: freezed == valueID
            ? _value.valueID
            : valueID // ignore: cast_nullable_to_non_nullable
                  as int?,
        optionID: freezed == optionID
            ? _value.optionID
            : optionID // ignore: cast_nullable_to_non_nullable
                  as int?,
        valueName: freezed == valueName
            ? _value.valueName
            : valueName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OptionValueImpl extends _OptionValue {
  const _$OptionValueImpl({this.valueID, this.optionID, this.valueName})
    : super._();

  @override
  final int? valueID;
  @override
  final int? optionID;
  @override
  final String? valueName;

  @override
  String toString() {
    return 'OptionValue(valueID: $valueID, optionID: $optionID, valueName: $valueName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionValueImpl &&
            (identical(other.valueID, valueID) || other.valueID == valueID) &&
            (identical(other.optionID, optionID) ||
                other.optionID == optionID) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, valueID, optionID, valueName);

  /// Create a copy of OptionValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionValueImplCopyWith<_$OptionValueImpl> get copyWith =>
      __$$OptionValueImplCopyWithImpl<_$OptionValueImpl>(this, _$identity);
}

abstract class _OptionValue extends OptionValue {
  const factory _OptionValue({
    final int? valueID,
    final int? optionID,
    final String? valueName,
  }) = _$OptionValueImpl;
  const _OptionValue._() : super._();

  @override
  int? get valueID;
  @override
  int? get optionID;
  @override
  String? get valueName;

  /// Create a copy of OptionValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionValueImplCopyWith<_$OptionValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
