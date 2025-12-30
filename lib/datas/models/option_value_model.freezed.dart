// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'option_value_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OptionValueModel _$OptionValueModelFromJson(Map<String, dynamic> json) {
  return _OptionValueModel.fromJson(json);
}

/// @nodoc
mixin _$OptionValueModel {
  @JsonKey(name: 'ValueID')
  int? get valueID => throw _privateConstructorUsedError;
  @JsonKey(name: 'OptionID')
  int? get optionID => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValueName')
  String? get valueName => throw _privateConstructorUsedError;

  /// Serializes this OptionValueModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OptionValueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OptionValueModelCopyWith<OptionValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionValueModelCopyWith<$Res> {
  factory $OptionValueModelCopyWith(
    OptionValueModel value,
    $Res Function(OptionValueModel) then,
  ) = _$OptionValueModelCopyWithImpl<$Res, OptionValueModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'ValueID') int? valueID,
    @JsonKey(name: 'OptionID') int? optionID,
    @JsonKey(name: 'ValueName') String? valueName,
  });
}

/// @nodoc
class _$OptionValueModelCopyWithImpl<$Res, $Val extends OptionValueModel>
    implements $OptionValueModelCopyWith<$Res> {
  _$OptionValueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OptionValueModel
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
abstract class _$$OptionValueModelImplCopyWith<$Res>
    implements $OptionValueModelCopyWith<$Res> {
  factory _$$OptionValueModelImplCopyWith(
    _$OptionValueModelImpl value,
    $Res Function(_$OptionValueModelImpl) then,
  ) = __$$OptionValueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'ValueID') int? valueID,
    @JsonKey(name: 'OptionID') int? optionID,
    @JsonKey(name: 'ValueName') String? valueName,
  });
}

/// @nodoc
class __$$OptionValueModelImplCopyWithImpl<$Res>
    extends _$OptionValueModelCopyWithImpl<$Res, _$OptionValueModelImpl>
    implements _$$OptionValueModelImplCopyWith<$Res> {
  __$$OptionValueModelImplCopyWithImpl(
    _$OptionValueModelImpl _value,
    $Res Function(_$OptionValueModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OptionValueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueID = freezed,
    Object? optionID = freezed,
    Object? valueName = freezed,
  }) {
    return _then(
      _$OptionValueModelImpl(
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
@JsonSerializable()
class _$OptionValueModelImpl extends _OptionValueModel {
  const _$OptionValueModelImpl({
    @JsonKey(name: 'ValueID') this.valueID,
    @JsonKey(name: 'OptionID') this.optionID,
    @JsonKey(name: 'ValueName') this.valueName,
  }) : super._();

  factory _$OptionValueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OptionValueModelImplFromJson(json);

  @override
  @JsonKey(name: 'ValueID')
  final int? valueID;
  @override
  @JsonKey(name: 'OptionID')
  final int? optionID;
  @override
  @JsonKey(name: 'ValueName')
  final String? valueName;

  @override
  String toString() {
    return 'OptionValueModel(valueID: $valueID, optionID: $optionID, valueName: $valueName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OptionValueModelImpl &&
            (identical(other.valueID, valueID) || other.valueID == valueID) &&
            (identical(other.optionID, optionID) ||
                other.optionID == optionID) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, valueID, optionID, valueName);

  /// Create a copy of OptionValueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OptionValueModelImplCopyWith<_$OptionValueModelImpl> get copyWith =>
      __$$OptionValueModelImplCopyWithImpl<_$OptionValueModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OptionValueModelImplToJson(this);
  }
}

abstract class _OptionValueModel extends OptionValueModel {
  const factory _OptionValueModel({
    @JsonKey(name: 'ValueID') final int? valueID,
    @JsonKey(name: 'OptionID') final int? optionID,
    @JsonKey(name: 'ValueName') final String? valueName,
  }) = _$OptionValueModelImpl;
  const _OptionValueModel._() : super._();

  factory _OptionValueModel.fromJson(Map<String, dynamic> json) =
      _$OptionValueModelImpl.fromJson;

  @override
  @JsonKey(name: 'ValueID')
  int? get valueID;
  @override
  @JsonKey(name: 'OptionID')
  int? get optionID;
  @override
  @JsonKey(name: 'ValueName')
  String? get valueName;

  /// Create a copy of OptionValueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OptionValueModelImplCopyWith<_$OptionValueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
