abstract class RegisterEvent {}

// Gửi OTP
class SendOtpEvent extends RegisterEvent {
  final String email;
  SendOtpEvent(this.email);
}

// Xác thực OTP
class VerifyOtpEvent extends RegisterEvent {
  final String email;
  final String otp;
  VerifyOtpEvent(this.email, this.otp);
}

// Đăng ký người dùng
class RegisterCustomerEvent extends RegisterEvent {
  final String email;
  final String username;
  final String password;
  final String registrationToken;

  RegisterCustomerEvent({
    required this.email,
    required this.username,
    required this.password,
    required this.registrationToken,
  });
}

// Đặt lại mật khẩu
class ResetPassEvent extends RegisterEvent {
  final String email;
  final String password;
  final String resetpassToken;

  ResetPassEvent({
    required this.email,
    required this.password,
    required this.resetpassToken,
  });
}
