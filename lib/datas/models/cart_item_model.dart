import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

double _doubleFromJson(dynamic v) {
  if (v == null) return 0.0;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0.0;
}

dynamic _doubleToJson(double v) => v;

@freezed
class CartItemModel with _$CartItemModel {
  const CartItemModel._();

  const factory CartItemModel({
    @JsonKey(name: 'CartItemID') int? cartItemId,
    @JsonKey(name: 'CartID') required int cartId,
    @JsonKey(name: 'ProductID') required int productId,
    @Default(1) @JsonKey(name: 'Quantity') int quantity,
    @JsonKey(name: 'Price', fromJson: _doubleFromJson, toJson: _doubleToJson)
    required double price,
    @JsonKey(name: 'is_selected') @Default(false) bool isSelected,
    @JsonKey(name: 'CreatedAt') DateTime? createdAt,
    @JsonKey(name: 'UpdatedAt') DateTime? updatedAt,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  /// computed total (keeps in sync with quantity and price)
  double get total => quantity * price;
}
