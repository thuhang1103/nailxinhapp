
import '../../domain/entities/user.dart';

class UserModel {
  final int userId;
  final String userName;
  final String email;
  final String password;
  final String role;
  final String? phone;
  final String? avatarImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.password,
    required this.role,
    this.phone,
    this.avatarImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['UserID'] as int,
      userName: json['UserName'],
      email: json['Email'],
      password: json['Password'],
      role: json['Role'],
      phone: json['Phone'],
      avatarImage: json['avatarImage'],
      createdAt: DateTime.parse(json['CreatedAt']),
      updatedAt: DateTime.parse(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    'UserID': userId,
    'UserName': userName,
    'Email': email,
    'Password': password,
    'Role': role,
    'Phone': phone,
    'avatarImage': avatarImage,
    'CreatedAt': createdAt.toIso8601String(),
    'UpdatedAt': updatedAt.toIso8601String(),
  };
  User toEntity() {
    return User(
      userId: this.userId,
      userName: this.userName,
      email: this.email,
      role: this.role,
      phone: this.phone,
      avatarImage: this.avatarImage,
    );
  }
}