// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionValueModelImpl _$$OptionValueModelImplFromJson(
  Map<String, dynamic> json,
) => _$OptionValueModelImpl(
  valueID: (json['ValueID'] as num?)?.toInt(),
  optionID: (json['OptionID'] as num?)?.toInt(),
  valueName: json['ValueName'] as String?,
);

Map<String, dynamic> _$$OptionValueModelImplToJson(
  _$OptionValueModelImpl instance,
) => <String, dynamic>{
  'ValueID': instance.valueID,
  'OptionID': instance.optionID,
  'ValueName': instance.valueName,
};
