import '../../domain/entities/user_token.dart';

abstract class AuthState {}

// Trạng thái ban đầu
class AuthInitial extends AuthState {}

// Đang xử lý đăng nhập
class AuthLoading extends AuthState {}

// Đăng nhập thành công
// class AuthSuccess extends AuthState {
//   final UserToken userToken;
//   AuthSuccess(this.userToken);
// }

// Đăng nhập thất bại
class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

class AuthenticateInitial extends AuthState {}

class AuthenticateLoading extends AuthState {}

class Authenticated extends AuthState {
  final String role;
  Authenticated(this.role);
}

class TokenExpired extends AuthState {
  final String? error;
  TokenExpired(this.error);
}

class Unauthenticated extends AuthState {
  final String? error;
  Unauthenticated(this.error);
}
