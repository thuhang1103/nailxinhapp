import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const Profile._(); // private ctor for custom getters

  const factory Profile({
    String? userName,
    String? fullName,
    String? phone,
    String? email,
    String? membershipLevel,
  }) = _Profile;
}
