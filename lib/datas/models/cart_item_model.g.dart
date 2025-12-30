// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemModelImpl _$$CartItemModelImplFromJson(Map<String, dynamic> json) =>
    _$CartItemModelImpl(
      cartItemId: (json['CartItemID'] as num?)?.toInt(),
      cartId: (json['CartID'] as num?)?.toInt(),
      productId: (json['ProductID'] as num?)?.toInt(),
      variantId: (json['VariantID'] as num?)?.toInt(),
      variantName: json['VariantName'] as String?,
      productName: json['ProductName'] as String?,
      imagePath: json['ImagePath'] as String?,
      quantity: (json['Quantity'] as num?)?.toInt() ?? 1,
      price: json['Price'] == null ? 0.0 : _parseDouble(json['Price']),
      stock: (json['Stock'] as num?)?.toInt() ?? 0,
      total: json['Total'] == null ? 0.0 : _parseDouble(json['Total']),
      isSelected: (json['is_selected'] as num?)?.toInt() ?? 0,
      createdAt: json['CreatedAt'] as String?,
      updatedAt: json['UpdatedAt'] as String?,
    );

Map<String, dynamic> _$$CartItemModelImplToJson(_$CartItemModelImpl instance) =>
    <String, dynamic>{
      'CartItemID': instance.cartItemId,
      'CartID': instance.cartId,
      'ProductID': instance.productId,
      'VariantID': instance.variantId,
      'VariantName': instance.variantName,
      'ProductName': instance.productName,
      'ImagePath': instance.imagePath,
      'Quantity': instance.quantity,
      'Price': instance.price,
      'Stock': instance.stock,
      'Total': instance.total,
      'is_selected': instance.isSelected,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
    };
