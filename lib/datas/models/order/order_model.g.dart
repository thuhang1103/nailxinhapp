// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      orderID: (json['OrderID'] as num?)?.toInt(),
      addressID: (json['AddressID'] as num?)?.toInt(),
      addressName: json['AddressName'] as String?,
      voucherID: (json['VoucherID'] as num?)?.toInt(),
      totalAmount: _doubleFromJson(json['TotalAmount']),
      discountAmount: _doubleFromJson(json['DiscountAmount']),
      finalAmount: _doubleFromJson(json['FinalAmount']),
      orderDate: _dateTimeFromJson(json['OrderDate']),
      updatedAt: _dateTimeFromJson(json['UpdatedAt']),
      paidStatus: json['Paid_Status'] as String?,
      orderStatus: json['Order_Status'] as String?,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'OrderID': instance.orderID,
      'AddressID': instance.addressID,
      'AddressName': instance.addressName,
      'VoucherID': instance.voucherID,
      'TotalAmount': _doubleToJson(instance.totalAmount),
      'DiscountAmount': _doubleToJson(instance.discountAmount),
      'FinalAmount': _doubleToJson(instance.finalAmount),
      'OrderDate': _dateTimeToJson(instance.orderDate),
      'UpdatedAt': _dateTimeToJson(instance.updatedAt),
      'Paid_Status': instance.paidStatus,
      'Order_Status': instance.orderStatus,
    };
