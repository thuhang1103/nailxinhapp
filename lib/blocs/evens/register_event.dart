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
  final String password;
  final String username;
  final String registrationToken;

  RegisterCustomerEvent({
    required this.email,
    required this.password,
    required this.username,
    required this.registrationToken,
  });
}
