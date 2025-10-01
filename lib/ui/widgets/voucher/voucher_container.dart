import 'package:flutter/material.dart';
import '../../../core/color/mycolor.dart';

class VoucherContainer extends StatelessWidget {
  final String imageUrl;
  final String maxDiscount;
  final String minValue;
  final DateTime startTime;
  final DateTime endTime;
  final VoidCallback onSave;

  const VoucherContainer({
    Key? key,
    this.imageUrl = 'assets/icons/Abstract Shape (5).png',
    this.maxDiscount = '0',
    this.minValue = '0',
    required this.startTime,
    required this.endTime,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: MyColor.mainGradient,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Giảm tối đa $maxDiscountđ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'đơn tối thiểu: $minValueđ',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  'Có hiệu lực từ ${_formatDate(startTime)} Đến ${_formatDate(endTime)}',
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: MyColor.mainGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Nền trong suốt
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
              ),
              child: const Text('Lưu', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year}';
  }
}
