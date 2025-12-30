import 'package:flutter/material.dart';

class OrderStatusButton extends StatelessWidget {
  final String imageAsset;
  final String text;
  final VoidCallback onPressed;
  final double size;

  const OrderStatusButton({
    super.key,
    required this.imageAsset,
    required this.text,
    required this.onPressed,
    this.size = 45, // kích thước nút vuông
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2.5, // viền đen dày
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover, // fill full nút
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: size + 8,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
