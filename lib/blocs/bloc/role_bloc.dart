import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/domain/usecases/get_role.dart';
import '../evens/role_event.dart';
import '../states/role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  final GetRoleUseCase getRoleUseCase;

  RoleBloc({required this.getRoleUseCase}) : super(RoleInitial()) {
    on<FetchRole>((event, emit) async {
      emit(RoleLoading());
      try {
        final role = await getRoleUseCase(); // gọi usecase để lấy role từ token
        emit(RoleLoaded(role));
      } catch (e) {
        emit(RoleError("Không lấy được role: $e"));
      }
    });
  }
}
