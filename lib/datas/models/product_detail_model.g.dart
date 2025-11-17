// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailModelImpl _$$ProductDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProductDetailModelImpl(
  productId: (json['ProductID'] as num?)?.toInt(),
  productName: json['ProductName'] as String?,
  description: json['Description'] as String?,
  basePrice: (json['BasePrice'] as num?)?.toDouble(),
  categoryId: (json['CategoryID'] as num?)?.toInt(),
  stockQuantity: (json['StockQuantity'] as num?)?.toInt() ?? 0,
  soldQuantity: (json['SoldQuantity'] as num?)?.toInt() ?? 0,
  createdAt: json['CreatedAt'] == null
      ? null
      : DateTime.parse(json['CreatedAt'] as String),
  updatedAt: json['UpdatedAt'] == null
      ? null
      : DateTime.parse(json['UpdatedAt'] as String),
  statusProduct: json['Status_Product'] as String?,
  images:
      (json['Images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$$ProductDetailModelImplToJson(
  _$ProductDetailModelImpl instance,
) => <String, dynamic>{
  'ProductID': instance.productId,
  'ProductName': instance.productName,
  'Description': instance.description,
  'BasePrice': instance.basePrice,
  'CategoryID': instance.categoryId,
  'StockQuantity': instance.stockQuantity,
  'SoldQuantity': instance.soldQuantity,
  'CreatedAt': instance.createdAt?.toIso8601String(),
  'UpdatedAt': instance.updatedAt?.toIso8601String(),
  'Status_Product': instance.statusProduct,
  'Images': instance.images,
};
