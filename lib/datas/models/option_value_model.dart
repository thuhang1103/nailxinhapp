import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/option_value.dart' as entity;

part 'option_value_model.freezed.dart';
part 'option_value_model.g.dart';

@freezed
class OptionValueModel with _$OptionValueModel {
  const OptionValueModel._();

  const factory OptionValueModel({
    @JsonKey(name: 'ValueID') int? valueID,

    @JsonKey(name: 'OptionID') int? optionID,
    @JsonKey(name: 'ValueName') String? valueName,
  }) = _OptionValueModel;

  factory OptionValueModel.fromJson(Map<String, dynamic> json) =>
      _$OptionValueModelFromJson(json);

  entity.OptionValue toEntity() {
    return entity.OptionValue(
      valueID: valueID,
      optionID: optionID,
      valueName: valueName,
    );
  }
}
