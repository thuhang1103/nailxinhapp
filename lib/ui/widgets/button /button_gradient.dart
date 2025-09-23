import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';

class ButtonGradient extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final Gradient gradient;
  final double borderRadius;
  final TextStyle? textStyle;

  const ButtonGradient({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.height = 40,
    this.gradient = MyColor.mainGradient,
    this.borderRadius = 20,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              textStyle ??
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
