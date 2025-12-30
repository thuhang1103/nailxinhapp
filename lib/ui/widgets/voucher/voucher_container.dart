import 'package:flutter/material.dart';
import '../../../core/color/mycolor.dart';
import 'package:intl/intl.dart';

class VoucherContainer extends StatelessWidget {
  final String imageUrl;
  final String Discount;
  final String minValue;
  final DateTime startTime;
  final DateTime endTime;

  const VoucherContainer({
    Key? key,
    this.imageUrl = 'assets/icons/Abstract Shape (5).png',
    this.Discount = '0',
    this.minValue = '0',
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final discountValue = double.tryParse(Discount.toString()) ?? 0;
    final minValueFormatted = double.tryParse(minValue.toString()) ?? 0;
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
                  'Giảm ${NumberFormat("#,###", "vi_VN").format(discountValue)}đ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'đơn tối thiểu: ${NumberFormat("#,###", "vi_VN").format(minValueFormatted)}đ',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  'Có hiệu lực từ ${_formatDate(startTime)} Đến ${_formatDate(endTime)}',
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
              ],
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
