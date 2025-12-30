import 'package:freezed_annotation/freezed_annotation.dart';
//entity
import '../../domain/entities/profile.dart' as entity;

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    @JsonKey(name: 'UserName') String? userName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'MembershipLevel') String? membershipLevel,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  /// chuyển từ Model sang Entity

  entity.Profile toEntity() {
    return entity.Profile(
      userName: userName,
      fullName: fullName,
      phone: phone,
      email: email,
      membershipLevel: membershipLevel,
    );
  }

  /// computed total (keeps in sync with quantity and price)
}
