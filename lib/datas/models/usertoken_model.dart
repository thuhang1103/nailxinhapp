import '../../domain/entities/user_token.dart';

class UserTokenModel {
  final String accessToken;
  final String refreshToken;

  const UserTokenModel({required this.accessToken, required this.refreshToken});

  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(
      accessToken: json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': accessToken, 'refreshToken': refreshToken};
  }

  UserToken toEntity() {
    return UserToken(accessToken: accessToken, refreshToken: refreshToken);
  }

  @override
  String toString() =>
      'UserToken(accessToken: $accessToken, refreshToken: $refreshToken)';
}
