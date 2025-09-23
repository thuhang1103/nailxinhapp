// mycolor.dart
import 'package:flutter/material.dart';

class MyColor {
  static const Color startColor = Color(0xFFE60585); // Màu xanh
  static const Color endColor = Color(0xFF00D0DD); // Màu tím

  static const LinearGradient mainGradient = LinearGradient(
    colors: [startColor, endColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Color textColor = Color(0xFF5A0530); // Màu xám đậm dễ đọc
  static const Color startColor1 = Color(0xFFebd6e3); // Màu xanh
  static const Color endColor2 = Color(0xFFd291bc); // Màu tím
  static const Color colorbackround2 = Color(0xFFD291BC);
  static const Color colorappbar = Color.fromARGB(255, 212, 198, 208);

  // 🎨 Màu chữ phụ (nếu cần)
  static const LinearGradient colorbackground = LinearGradient(
    colors: [startColor1, endColor2],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
