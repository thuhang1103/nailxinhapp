//freezed
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/common_state.dart';
import '../../domain/entities/profile.dart';

part 'fetch_profile_state.freezed.dart';

@freezed
class FetchProfileState with _$FetchProfileState {
  const factory FetchProfileState({
    Profile? profile,
    @Default('') String fullName,
    @Default('') String phone,

    @Default(CommonState.initial()) CommonState getProfileState,
    @Default(CommonState.initial()) CommonState updateProfileState,
    @Default(CommonState.initial()) CommonState deleteAccountState,
  }) = _FetchProfileState;
}
