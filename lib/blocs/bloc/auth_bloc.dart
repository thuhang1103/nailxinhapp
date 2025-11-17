import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nailxinh/domain/usecases/get_role.dart';
import 'package:nailxinh/domain/usecases/refreshToken_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/repositories/auth_repository.dart';
import '../states/auth_state.dart';
import '../evens/auth_event.dart';
import 'package:dio/dio.dart';
import '../../domain/usecases/logout_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final FlutterSecureStorage storage;
  final GetRoleUseCase getRoleUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final LogoutUsecase logoutUsecase;

  AuthBloc({
    required this.loginUsecase,
    required this.storage,
    required this.getRoleUseCase,
    required this.refreshTokenUseCase,
    required this.logoutUsecase,
  }) : super(AuthInitial()) {
    // Khi mở app
    on<AppStarted>(_onAppStarted);

    // Khi login
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);

    // Khi refresh token
    on<RefreshTokenRequested>(_onRefreshToken);
  }

  /// 👉 Xử lý sự kiện mở app
  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final token = await storage.read(key: "token");
    final refreshToken = await storage.read(key: "refreshToken");
    if (token != null && refreshToken != null) {
      try {
        final role = await getRoleUseCase.call();
        emit(Authenticated(role));
      } catch (e) {
        emit(TokenExpired("Token hết hạn, vui lòng đăng nhập lại"));
      }
    } else {
      emit(Unauthenticated("chưa đăng nhập , vui lòng đăng nhập "));
    }
  }

  /// 👉 Xử lý login
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final tokenData = await loginUsecase.execute(
        event.username,
        event.password,
      );

      final role = await getRoleUseCase.call();
      emit(Authenticated(role));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  /// 👉 Xử lý refresh token
  Future<void> _onRefreshToken(
    RefreshTokenRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final refreshToken = await storage.read(key: "refreshToken");
      if (refreshToken == null) {
        emit(Unauthenticated("Thiếu refresh token"));
        return;
      }

      final newTokens = await refreshTokenUseCase.call(refreshToken);

      await storage.write(key: "token", value: newTokens["token"]);
      await storage.write(
        key: "refreshToken",
        value: newTokens["refreshToken"],
      );

      final role = await getRoleUseCase.call();
      emit(Authenticated(role));
    } catch (e) {
      emit(Unauthenticated("Làm mới token thất bại"));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    final message = await logoutUsecase.call();
    emit(Unauthenticated(message));
  }
}
