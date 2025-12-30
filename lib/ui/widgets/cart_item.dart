// lib/ui/widgets/cart_item.dart
import 'package:flutter/material.dart';
import 'package:nailxinh/ui/pages/cart_pages/cart_page.dart';
import 'package:nailxinh/core/color/mycolor.dart';

import 'package:intl/intl.dart';

class CartItemWidget extends StatelessWidget {
  final bool isSelected;
  final String imageUrl;
  final String name;
  final int quantity;
  final double price;
  final int stock;

  final VoidCallback? onRemove;
  final VoidCallback? onDiscount;
  final ValueChanged<bool?>? onSelect;
  final String? variant;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const CartItemWidget({
    super.key,
    required this.isSelected,
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.price,
    required this.stock,
    this.onRemove,
    this.onDiscount,
    this.onSelect,
    this.variant,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Checkbox
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Checkbox(
                      value: isSelected,
                      onChanged: onSelect,
                      activeColor: const Color.fromARGB(
                        255,
                        234,
                        132,
                        202,
                      ), // màu nền khi checkbox được chọn
                      checkColor: Colors.white,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              // Ảnh sản phẩm
              const SizedBox(width: 8),

              // Thông tin sản phẩm
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Tooltip(
                              message: name,
                              child: Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),

                          TextButton.icon(
                            onPressed: onRemove,
                            icon: const Icon(
                              Icons.edit,
                              size: 12,
                              color: Color.fromARGB(255, 234, 132, 202),
                            ),
                            label: const Text(
                              "Xoá",
                              style: TextStyle(
                                color: Color.fromARGB(255, 234, 132, 202),
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 28,
                            width: 120,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    // Mở modal chọn loại hàng
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 4,
                                    ),
                                    visualDensity: VisualDensity.compact,
                                    side: const BorderSide(
                                      color: Color.fromARGB(255, 234, 132, 202),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    variant ?? 'mặc định',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: const Color.fromARGB(
                                        255,
                                        234,
                                        132,
                                        202,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  height: 28,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'kho: $stock',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: const Color.fromARGB(
                                        255,
                                        234,
                                        132,
                                        202,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (quantity > 1) onDecrement?.call();
                                },
                                child: Icon(
                                  Icons.remove_circle_outline_outlined,
                                  size: 19, // icon nhỏ hơn
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(width: 4), // khoảng cách nhỏ
                              Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  quantity.toString(),
                                  style: const TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(width: 4),
                              GestureDetector(
                                onTap: onIncrement,
                                child: Icon(
                                  Icons.add_circle_outline_outlined,
                                  size: 19,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Text(
                      '${NumberFormat("#,###", "vi_VN").format(price)} đ',

                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Divider(
            color: const Color.fromARGB(255, 234, 132, 202),
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: 6),

          // --- Nút mã giảm giá ---
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 32,
              child: OutlinedButton.icon(
                onPressed: onDiscount,
                icon: const Icon(
                  Icons.local_offer_outlined,
                  size: 14,
                  color: const Color.fromARGB(255, 234, 132, 202),
                ),
                // set label color in TextStyle
                label: const Text(
                  'Voucher',
                  style: TextStyle(
                    fontSize: 12,
                    color: const Color.fromARGB(255, 234, 132, 202),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  visualDensity: VisualDensity.compact,
                  side: BorderSide(
                    color: const Color.fromARGB(255, 234, 132, 202),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
