import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState1 with _$CommonState1 {
  const factory CommonState1.initial() = Initial;
  const factory CommonState1.loading() = Loading;
  const factory CommonState1.success({dynamic data}) = Success;
  const factory CommonState1.error(Exception failure) = Error;
}
