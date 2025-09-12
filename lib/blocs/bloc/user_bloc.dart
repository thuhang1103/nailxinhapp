import 'package:nailxinh/blocs/evens/user_event.dart';
import 'package:nailxinh/blocs/states/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/domain/usecases/get_user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;

  UserBloc({required this.getUsers}) : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      emit(UserLoading());
      try {
        final users = await getUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}







// UserBloc(this.getUsers) : super(UserInitial()) {
// on<LoadUsers>((event, emit) async {
// emit(UserLoading());
// try {
// final users = await getUsers();
// emit(UserLoaded(users));
// } catch (e) {
// emit(UserError(e.toString()));
// }
// });
// }
// }
