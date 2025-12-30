import 'package:bloc/bloc.dart';

import '../../core/common_state.dart';
import '../../../core/appException.dart';
import 'dart:async';
//helper

import '../../core/helper.dart';
import '../../features/fetch_profile/fetch_profile_event.dart';
import '../../features/fetch_profile/fetch_profile_state.dart';
import '../../domain/usecases/customer_usecase.dart';

class FetchProfileBloc extends Bloc<ProfileEvent, FetchProfileState> {
  final CustomerUseCase customerUseCase;

  FetchProfileBloc({required this.customerUseCase})
    : super(const FetchProfileState()) {
    // register handlers
    on<GetProfile>(_onGetProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<DeleteAccount>(_onDeleteAccount);
    on<NameChanged>(_onNameChanged);
    on<PhoneChanged>(_onPhoneChanged);
  }
  Future<void> _onGetProfile(
    GetProfile event,
    Emitter<FetchProfileState> emit,
  ) async {
    emit(state.copyWith(getProfileState: const CommonState.loading()));

    try {
      final profile = await customerUseCase.getCustomerProfile();
      emit(
        state.copyWith(
          profile: profile,
          getProfileState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getProfileState: CommonState.error(BusinessException(e.toString())),
        ),
      );
    }
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<FetchProfileState> emit,
  ) async {
    emit(state.copyWith(updateProfileState: const CommonState.loading()));

    try {
      final update = await customerUseCase.updateCustomerProfile(
        fullName: state.fullName,
        phone: state.phone,
      );
      final profile = await customerUseCase.getCustomerProfile();
      emit(
        state.copyWith(
          profile: profile,
          updateProfileState: const CommonState.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          updateProfileState: CommonState.error(
            BusinessException(e.toString()),
          ),
        ),
      );
    }
  }

  Future<void> _onDeleteAccount(
    DeleteAccount event,
    Emitter<FetchProfileState> emit,
  ) async {
    emit(state.copyWith(deleteAccountState: const CommonState.loading()));

    try {
      await customerUseCase.deleteAccount();
      emit(state.copyWith(deleteAccountState: const CommonState.success()));
    } catch (e) {
      emit(
        state.copyWith(
          deleteAccountState: CommonState.error(
            BusinessException(e.toString()),
          ),
        ),
      );
    }
  }

  void _onNameChanged(NameChanged event, Emitter<FetchProfileState> emit) {
    print('Name changed: ${event.name}');
    emit(state.copyWith(fullName: event.name));
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<FetchProfileState> emit) {
    print('Phone changed: ${event.phone}');
    emit(state.copyWith(phone: event.phone));
  }
}
