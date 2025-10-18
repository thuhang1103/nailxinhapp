//CartItemID INT AUTO_INCREMENT PRIMARY KEY,
// CartID INT NOT NULL,                            -- liên kết giỏ hàng
// ProductID INT NOT NULL,                         -- liên kết sản phẩm
// Quantity INT NOT NULL DEFAULT 1,
// Price DECIMAL(10,2) NOT NULL,                  -- giá sản phẩm khi thêm vào giỏ
// Total DECIMAL(10,2) AS (Quantity * Price) STORED, -- tổng tiền
// is_selected TINYINT DEFAULT 0,                 -- có chọn hay không
// CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,  -- ngày tạo
// UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- ngày cập nhật
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

double _doubleFromJson(dynamic v) {
  if (v == null) return 0.0;
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0.0;
}

dynamic _doubleToJson(double v) => v;
String _centsToDecimalString(int cents) => (cents / 100.0).toStringAsFixed(2);

@freezed
class CartItem with _$CartItem {
  const CartItem._(); // private ctor for custom getters

  const factory CartItem({
    int? id,
    int? cartId,
    required int productId,
    @Default(1) int quantity,

    @JsonKey(fromJson: _doubleFromJson, toJson: _doubleToJson)
    required double price,
    @Default(false) bool isSelected,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  // computed property
  double get total => quantity * price;
}
