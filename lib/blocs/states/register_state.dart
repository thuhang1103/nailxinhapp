abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  final dynamic data;

  const RegisterSuccess(this.message, {this.data});
}

class RegisterFailure extends RegisterState {
  final String error;
  const RegisterFailure(this.error);
}

//``` OTP gửi
class SendOtpLoading extends RegisterState {}

class SendOtpSuccess extends RegisterState {
  final String message;
  const SendOtpSuccess(this.message);
}

class SendOtpFailure extends RegisterState {
  final String error;
  const SendOtpFailure(this.error);
}

// OTP xác thực
class VerifyOtpLoading extends RegisterState {}

class VerifyOtpSuccess extends RegisterState {
  final String message;
  final dynamic token;
  const VerifyOtpSuccess(this.message, {this.token});
}

class VerifyOtpFailure extends RegisterState {
  final String error;
  const VerifyOtpFailure(this.error);
}

//resetPass
class ResetPassLoading extends RegisterState {}

class ResetPassSuccess extends RegisterState {
  final String message;
  final dynamic data;

  const ResetPassSuccess(this.message, {this.data});
}

class ResetPassFailure extends RegisterState {
  final String error;
  const ResetPassFailure(this.error);
}
