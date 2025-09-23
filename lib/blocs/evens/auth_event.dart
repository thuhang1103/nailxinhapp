abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;
  LoginRequested(this.username, this.password);
}

class AppStarted extends AuthEvent {}

class RefreshTokenRequested extends AuthEvent {}

class LogoutRequested extends AuthEvent {}
