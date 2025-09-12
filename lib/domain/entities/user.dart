class User {
  final int userId;
  final String userName;
  final String email;
  final String role;
  final String? phone;
  final String? avatarImage;

  const User({
    required this.userId,
    required this.userName,
    required this.email,
    required this.role,
    this.phone,
    this.avatarImage,
  });
}