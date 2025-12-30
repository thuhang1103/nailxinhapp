// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OptionModelImpl _$$OptionModelImplFromJson(Map<String, dynamic> json) =>
    _$OptionModelImpl(
      optionID: (json['OptionID'] as num?)?.toInt(),
      productID: (json['ProductID'] as num?)?.toInt(),
      optionName: json['OptionName'] as String?,
    );

Map<String, dynamic> _$$OptionModelImplToJson(_$OptionModelImpl instance) =>
    <String, dynamic>{
      'OptionID': instance.optionID,
      'ProductID': instance.productID,
      'OptionName': instance.optionName,
    };
