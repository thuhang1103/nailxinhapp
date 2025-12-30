import 'package:freezed_annotation/freezed_annotation.dart';
import 'option_value.dart';

part 'option.freezed.dart';

@freezed
class Option with _$Option {
  const Option._();

  const factory Option({int? optionID, int? productID, String? optionName}) =
      _Option;
}
