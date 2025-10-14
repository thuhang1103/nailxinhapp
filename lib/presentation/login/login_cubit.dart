import 'login_state.dart';
import 'common_state.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/get_role.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase useCase;
  final GetRoleUseCase getRoleUseCase;
  LoginCubit({required this.useCase, required this.getRoleUseCase})
    : super(initial());

  Future<void> signin({
    required String username,
    required String password,
  }) async {
    emit(LoginState(loginState: CommonState.loading()));
    try {
      final tokenData = await useCase.execute(username, password);
      final role = await getRoleUseCase.call();
      emit(
        LoginState(
          loginState: CommonState.success(data: tokenData),
          role: role,
        ),
      );
    } catch (e) {
      emit(LoginState(loginState: CommonState.error(e as Exception)));
    }
  }
}
