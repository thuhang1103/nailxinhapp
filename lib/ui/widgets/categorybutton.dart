import 'package:flutter/material.dart';
import '../../core/color/mycolor.dart';

class CategoryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imageUrl; // Đường dẫn ảnh icon
  final double size;
  final String text;
  final Color textColor;
  final Gradient backgroundGradient;
  final double borderRadius;

  const CategoryButton({
    Key? key,
    required this.onPressed,
    required this.imageUrl,
    required this.text,
    this.textColor = Colors.black,
    this.size = 45,
    this.backgroundGradient = MyColor.mainGradient,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              gradient: backgroundGradient,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(
              child: Image.asset(
                imageUrl,
                width: size * 0.6,
                height: size * 0.6,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 9,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
