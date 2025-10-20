import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState with _$CommonState {
  const factory CommonState.initial() = Initial;
  const factory CommonState.loading() = Loading;
  const factory CommonState.success({dynamic data}) = Success;
  const factory CommonState.error(Exception failure) = Error;
}
