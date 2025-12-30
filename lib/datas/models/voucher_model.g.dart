// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoucherModelImpl _$$VoucherModelImplFromJson(Map<String, dynamic> json) =>
    _$VoucherModelImpl(
      voucherId: (json['VoucherID'] as num?)?.toInt(),
      code: json['Code'] as String?,
      description: json['Description'] as String?,
      discountAmount: (json['DiscountAmount'] as num?)?.toInt(),
      minOrderValue: (json['MinOrderValue'] as num?)?.toInt(),
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
    );

Map<String, dynamic> _$$VoucherModelImplToJson(_$VoucherModelImpl instance) =>
    <String, dynamic>{
      'VoucherID': instance.voucherId,
      'Code': instance.code,
      'Description': instance.description,
      'DiscountAmount': instance.discountAmount,
      'MinOrderValue': instance.minOrderValue,
      'StartDate': instance.startDate?.toIso8601String(),
      'EndDate': instance.endDate?.toIso8601String(),
    };
