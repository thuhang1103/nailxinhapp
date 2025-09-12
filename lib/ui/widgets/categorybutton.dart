import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double size;
  final Color backgroundColor;
  final double borderRadius;

  const CategoryButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.size = 60,
    this.backgroundColor = Colors.blueAccent,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size, size),
        backgroundColor: backgroundColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: child,
    );
  }
}