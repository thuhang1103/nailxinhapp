// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OptionModel _$OptionModelFromJson(Map<String, dynamic> json) {
  return _OptionModel.fromJson(json);
}

/// @nodoc
mixin _$OptionModel {
  @JsonKey(name: 'OptionID')
  int? get optionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductID')
  int? get productID => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptionName')
  String? get optionName => throw _privateConstructorUsedError;

  /// Serializes this OptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionModelCopyWith<OptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionModelCopyWith<$Res> {
  factory $OptionModelCopyWith(
    OptionModel value,
    $Res Function(OptionModel) then,
  ) = _$OptionModelCopyWithImpl<$Res, OptionModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'OptionID') int? optionID,
    @JsonKey(name: 'ProductID') int? productID,
    @JsonKey(name: 'OptionName') String? optionName,
  });
}

/// @nodoc
class _$OptionModelCopyWithImpl<$Res, $Val extends OptionModel>
    implements $OptionModelCopyWith<$Res> {
  _$OptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptionModel
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
abstract class _$$OptionModelImplCopyWith<$Res>
    implements $OptionModelCopyWith<$Res> {
  factory _$$OptionModelImplCopyWith(
    _$OptionModelImpl value,
    $Res Function(_$OptionModelImpl) then,
  ) = __$$OptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'OptionID') int? optionID,
    @JsonKey(name: 'ProductID') int? productID,
    @JsonKey(name: 'OptionName') String? optionName,
  });
}

/// @nodoc
class __$$OptionModelImplCopyWithImpl<$Res>
    extends _$OptionModelCopyWithImpl<$Res, _$OptionModelImpl>
    implements _$$OptionModelImplCopyWith<$Res> {
  __$$OptionModelImplCopyWithImpl(
    _$OptionModelImpl _value,
    $Res Function(_$OptionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? optionID = freezed,
    Object? productID = freezed,
    Object? optionName = freezed,
  }) {
    return _then(
      _$OptionModelImpl(
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
@JsonSerializable()
class _$OptionModelImpl extends _OptionModel {
  const _$OptionModelImpl({
    @JsonKey(name: 'OptionID') this.optionID,
    @JsonKey(name: 'ProductID') this.productID,
    @JsonKey(name: 'OptionName') this.optionName,
  }) : super._();

  factory _$OptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionModelImplFromJson(json);

  @override
  @JsonKey(name: 'OptionID')
  final int? optionID;
  @override
  @JsonKey(name: 'ProductID')
  final int? productID;
  @override
  @JsonKey(name: 'OptionName')
  final String? optionName;

  @override
  String toString() {
    return 'OptionModel(optionID: $optionID, productID: $productID, optionName: $optionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionModelImpl &&
            (identical(other.optionID, optionID) ||
                other.optionID == optionID) &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.optionName, optionName) ||
                other.optionName == optionName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, optionID, productID, optionName);

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionModelImplCopyWith<_$OptionModelImpl> get copyWith =>
      __$$OptionModelImplCopyWithImpl<_$OptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionModelImplToJson(this);
  }
}

abstract class _OptionModel extends OptionModel {
  const factory _OptionModel({
    @JsonKey(name: 'OptionID') final int? optionID,
    @JsonKey(name: 'ProductID') final int? productID,
    @JsonKey(name: 'OptionName') final String? optionName,
  }) = _$OptionModelImpl;
  const _OptionModel._() : super._();

  factory _OptionModel.fromJson(Map<String, dynamic> json) =
      _$OptionModelImpl.fromJson;

  @override
  @JsonKey(name: 'OptionID')
  int? get optionID;
  @override
  @JsonKey(name: 'ProductID')
  int? get productID;
  @override
  @JsonKey(name: 'OptionName')
  String? get optionName;

  /// Create a copy of OptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionModelImplCopyWith<_$OptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
