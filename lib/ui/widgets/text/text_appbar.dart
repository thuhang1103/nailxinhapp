import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  const TitleText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 22,
        color: color ?? MyColor.textColor,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
