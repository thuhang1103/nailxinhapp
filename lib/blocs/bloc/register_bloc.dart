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
        await registerUser.sendOtp(event.email);
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
          password: event.password,
          username: event.username,
          registrationToken: event.registrationToken,
        );
        emit(RegisterSuccess('Customer registered', data: userId));
      } catch (e) {
        emit(RegisterFailure(e.toString()));
      }
    });
  }
}
