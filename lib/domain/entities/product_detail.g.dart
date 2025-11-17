// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailImpl _$$ProductDetailImplFromJson(Map<String, dynamic> json) =>
    _$ProductDetailImpl(
      productId: (json['productId'] as num?)?.toInt(),
      productName: json['productName'] as String?,
      description: json['description'] as String?,
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      stockQuantity: (json['stockQuantity'] as num?)?.toInt() ?? 0,
      soldQuantity: (json['soldQuantity'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      statusProduct: json['statusProduct'] as String?,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$$ProductDetailImplToJson(_$ProductDetailImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'description': instance.description,
      'basePrice': instance.basePrice,
      'categoryId': instance.categoryId,
      'stockQuantity': instance.stockQuantity,
      'soldQuantity': instance.soldQuantity,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'statusProduct': instance.statusProduct,
      'images': instance.images,
    };
