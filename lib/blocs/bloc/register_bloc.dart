import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/register_user.dart';
import '../evens/register_event.dart';
import '../states/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUser registerUser;

  RegisterBloc({required this.registerUser}) : super(RegisterInitial()) {
    on<SendOtpEvent>((event, emit) async {
      emit(SendOtpLoading());
      try {
        print('vào bloc sent otp');
        await registerUser.sendOtp(event.email);
        print('send otp thành công');
        emit(const SendOtpSuccess('OTP sent'));
      } catch (e) {
        emit(SendOtpFailure(e.toString()));
      }
    });
    on<VerifyOtpEvent>((event, emit) async {
      emit(VerifyOtpLoading());
      try {
        final token = await registerUser.verifyOtp(event.email, event.otp);
        emit(VerifyOtpSuccess('OTP verified', token: token));
      } catch (e) {
        emit(VerifyOtpFailure(e.toString()));
      }
    });

    on<RegisterCustomerEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final userId = await registerUser.registerCustomer(
          email: event.email,
          username: event.username,
          password: event.password,
          registrationToken: event.registrationToken,
        );
        //gọi usecase đăgn kí cútomer và cart
        final customerId = await registerUser.addCustomer(
          userId: userId,
          fullName: event.username,
        );
        final cartId = await registerUser.createCart(customerId: customerId);
        emit(RegisterSuccess('Customer registered', data: userId));
      } catch (e) {
        emit(RegisterFailure(e.toString()));
      }
    });
    on<ResetPassEvent>((event, emit) async {
      emit(ResetPassLoading());
      try {
        final userName = await registerUser.resetpass(
          email: event.email,
          password: event.password,
          resetpassToken: event.resetpassToken,
        );
        emit(ResetPassSuccess('đổi mật khẩu thành công ', data: userName));
      } catch (e) {
        emit(ResetPassFailure(e.toString()));
      }
    });
  }
}
