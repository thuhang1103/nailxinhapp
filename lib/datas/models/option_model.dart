import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/option.dart' as entity;
import 'option_value_model.dart';

part 'option_model.freezed.dart';
part 'option_model.g.dart';

@freezed
class OptionModel with _$OptionModel {
  const OptionModel._();

  const factory OptionModel({
    @JsonKey(name: 'OptionID') int? optionID,
    @JsonKey(name: 'ProductID') int? productID,
    @JsonKey(name: 'OptionName') String? optionName,
  }) = _OptionModel;

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  entity.Option toEntity() {
    return entity.Option(
      optionID: optionID,
      productID: productID,
      optionName: optionName,
    );
  }
}
