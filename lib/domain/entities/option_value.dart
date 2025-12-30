import 'package:freezed_annotation/freezed_annotation.dart';

part 'option_value.freezed.dart';

@freezed
class OptionValue with _$OptionValue {
  const OptionValue._();

  const factory OptionValue({int? valueID, int? optionID, String? valueName}) =
      _OptionValue;
}
