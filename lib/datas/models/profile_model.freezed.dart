// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  @JsonKey(name: 'UserName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FullName')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'Email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'MembershipLevel')
  String? get membershipLevel => throw _privateConstructorUsedError;

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
    ProfileModel value,
    $Res Function(ProfileModel) then,
  ) = _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'UserName') String? userName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'MembershipLevel') String? membershipLevel,
  });
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? fullName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? membershipLevel = freezed,
  }) {
    return _then(
      _value.copyWith(
            userName: freezed == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String?,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            membershipLevel: freezed == membershipLevel
                ? _value.membershipLevel
                : membershipLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
    _$ProfileModelImpl value,
    $Res Function(_$ProfileModelImpl) then,
  ) = __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'UserName') String? userName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'MembershipLevel') String? membershipLevel,
  });
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
    _$ProfileModelImpl _value,
    $Res Function(_$ProfileModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? fullName = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? membershipLevel = freezed,
  }) {
    return _then(
      _$ProfileModelImpl(
        userName: freezed == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String?,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipLevel: freezed == membershipLevel
            ? _value.membershipLevel
            : membershipLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl extends _ProfileModel {
  const _$ProfileModelImpl({
    @JsonKey(name: 'UserName') this.userName,
    @JsonKey(name: 'FullName') this.fullName,
    @JsonKey(name: 'Phone') this.phone,
    @JsonKey(name: 'Email') this.email,
    @JsonKey(name: 'MembershipLevel') this.membershipLevel,
  }) : super._();

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  @JsonKey(name: 'UserName')
  final String? userName;
  @override
  @JsonKey(name: 'FullName')
  final String? fullName;
  @override
  @JsonKey(name: 'Phone')
  final String? phone;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'MembershipLevel')
  final String? membershipLevel;

  @override
  String toString() {
    return 'ProfileModel(userName: $userName, fullName: $fullName, phone: $phone, email: $email, membershipLevel: $membershipLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.membershipLevel, membershipLevel) ||
                other.membershipLevel == membershipLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    userName,
    fullName,
    phone,
    email,
    membershipLevel,
  );

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(this);
  }
}

abstract class _ProfileModel extends ProfileModel {
  const factory _ProfileModel({
    @JsonKey(name: 'UserName') final String? userName,
    @JsonKey(name: 'FullName') final String? fullName,
    @JsonKey(name: 'Phone') final String? phone,
    @JsonKey(name: 'Email') final String? email,
    @JsonKey(name: 'MembershipLevel') final String? membershipLevel,
  }) = _$ProfileModelImpl;
  const _ProfileModel._() : super._();

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  @JsonKey(name: 'UserName')
  String? get userName;
  @override
  @JsonKey(name: 'FullName')
  String? get fullName;
  @override
  @JsonKey(name: 'Phone')
  String? get phone;
  @override
  @JsonKey(name: 'Email')
  String? get email;
  @override
  @JsonKey(name: 'MembershipLevel')
  String? get membershipLevel;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
