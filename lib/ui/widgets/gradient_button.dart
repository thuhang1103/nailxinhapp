import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';
class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width, // nếu null thì sẽ tự co theo nội dung
      decoration: BoxDecoration(
        gradient: MyColor.mainGradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}