import 'package:flutter/material.dart';
import '../../domain/entities/cart_item.dart';
import 'package:intl/intl.dart';

class ConfirmOrderCartItem extends StatelessWidget {
  final CartItem item;

  const ConfirmOrderCartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh sản phẩm
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              item.imagePath ?? '',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 70,
                height: 70,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Thông tin sản phẩm
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên sản phẩm
                Text(
                  item.productName ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 4),

                // Variant
                if ((item.variantName ?? '').isNotEmpty)
                  Text(
                    item.variantName!,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),

                const SizedBox(height: 8),

                // Số lượng & giá
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'x${item.quantity ?? 0}',
                      style: const TextStyle(fontSize: 13),
                    ),
                    Text(
                      NumberFormat("#,###", "vi_VN").format(item.price) + 'đ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
