// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemModelImpl _$$CartItemModelImplFromJson(Map<String, dynamic> json) =>
    _$CartItemModelImpl(
      cartItemId: (json['CartItemID'] as num?)?.toInt(),
      cartId: (json['CartID'] as num).toInt(),
      productId: (json['ProductID'] as num).toInt(),
      quantity: (json['Quantity'] as num?)?.toInt() ?? 1,
      price: _doubleFromJson(json['Price']),
      isSelected: json['is_selected'] as bool? ?? false,
      createdAt: json['CreatedAt'] == null
          ? null
          : DateTime.parse(json['CreatedAt'] as String),
      updatedAt: json['UpdatedAt'] == null
          ? null
          : DateTime.parse(json['UpdatedAt'] as String),
    );

Map<String, dynamic> _$$CartItemModelImplToJson(_$CartItemModelImpl instance) =>
    <String, dynamic>{
      'CartItemID': instance.cartItemId,
      'CartID': instance.cartId,
      'ProductID': instance.productId,
      'Quantity': instance.quantity,
      'Price': _doubleToJson(instance.price),
      'is_selected': instance.isSelected,
      'CreatedAt': instance.createdAt?.toIso8601String(),
      'UpdatedAt': instance.updatedAt?.toIso8601String(),
    };
