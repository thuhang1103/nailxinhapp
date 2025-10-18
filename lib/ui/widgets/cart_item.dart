// lib/ui/widgets/cart_item.dart
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final bool isSelected;
  final String imageUrl;
  final String name;
  final String category;
  final int quantity;
  final double price;
  final VoidCallback? onEdit;
  final VoidCallback? onDiscount;
  final ValueChanged<bool?>? onSelect;

  const CartItem({
    super.key,
    required this.isSelected,
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.quantity,
    required this.price,
    this.onEdit,
    this.onDiscount,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
        children: [
          // --- Cột trên cùng: nút Sửa ---
          Align(
            alignment: Alignment.topRight,
            child: TextButton.icon(
              onPressed: onEdit,
              icon: const Icon(Icons.edit, size: 16),
              label: const Text("Sửa"),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),

          // --- Hàng chính: checkbox + ảnh + thông tin ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Checkbox
              Checkbox(value: isSelected, onChanged: onSelect),

              // Ảnh sản phẩm
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // Thông tin sản phẩm
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Loại: $category",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Số lượng: $quantity",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${price.toStringAsFixed(0)} đ",
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

          const SizedBox(height: 8),

          // --- Nút mã giảm giá ---
          Align(
            alignment: Alignment.bottomRight,
            child: OutlinedButton.icon(
              onPressed: onDiscount,
              icon: const Icon(Icons.local_offer_outlined, size: 18),
              label: const Text("Mã giảm giá"),
            ),
          ),
        ],
      ),
    );
  }
}
