// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Option {
  int? get optionID => throw _privateConstructorUsedError;
  int? get productID => throw _privateConstructorUsedError;
  String? get optionName => throw _privateConstructorUsedError;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call({int? optionID, int? productID, String? optionName});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionID = freezed,
    Object? productID = freezed,
    Object? optionName = freezed,
  }) {
    return _then(
      _value.copyWith(
            optionID: freezed == optionID
                ? _value.optionID
                : optionID // ignore: cast_nullable_to_non_nullable
                      as int?,
            productID: freezed == productID
                ? _value.productID
                : productID // ignore: cast_nullable_to_non_nullable
                      as int?,
            optionName: freezed == optionName
                ? _value.optionName
                : optionName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OptionImplCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$OptionImplCopyWith(
    _$OptionImpl value,
    $Res Function(_$OptionImpl) then,
  ) = __$$OptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? optionID, int? productID, String? optionName});
}

/// @nodoc
class __$$OptionImplCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$OptionImpl>
    implements _$$OptionImplCopyWith<$Res> {
  __$$OptionImplCopyWithImpl(
    _$OptionImpl _value,
    $Res Function(_$OptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionID = freezed,
    Object? productID = freezed,
    Object? optionName = freezed,
  }) {
    return _then(
      _$OptionImpl(
        optionID: freezed == optionID
            ? _value.optionID
            : optionID // ignore: cast_nullable_to_non_nullable
                  as int?,
        productID: freezed == productID
            ? _value.productID
            : productID // ignore: cast_nullable_to_non_nullable
                  as int?,
        optionName: freezed == optionName
            ? _value.optionName
            : optionName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OptionImpl extends _Option {
  const _$OptionImpl({this.optionID, this.productID, this.optionName})
    : super._();

  @override
  final int? optionID;
  @override
  final int? productID;
  @override
  final String? optionName;

  @override
  String toString() {
    return 'Option(optionID: $optionID, productID: $productID, optionName: $optionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionImpl &&
            (identical(other.optionID, optionID) ||
                other.optionID == optionID) &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.optionName, optionName) ||
                other.optionName == optionName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, optionID, productID, optionName);

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      __$$OptionImplCopyWithImpl<_$OptionImpl>(this, _$identity);
}

abstract class _Option extends Option {
  const factory _Option({
    final int? optionID,
    final int? productID,
    final String? optionName,
  }) = _$OptionImpl;
  const _Option._() : super._();

  @override
  int? get optionID;
  @override
  int? get productID;
  @override
  String? get optionName;

  /// Create a copy of Option
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionImplCopyWith<_$OptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
