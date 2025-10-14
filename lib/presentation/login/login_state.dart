import 'package:freezed_annotation/freezed_annotation.dart';
import 'common_state.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(CommonState.initial()) CommonState loginState,
    String? role, // Thêm thuộc tính role
  }) = _LoginState;
}

LoginState initial() => LoginState();
