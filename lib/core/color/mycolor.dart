// mycolor.dart
import 'package:flutter/material.dart';

class MyColor {
  static const Color startColor = Color(0xFFE60585); // Màu xanh
  static const Color endColor = Color(0xFF00D0DD); // Màu t
  static const Color pinkColor = Color(0xFFf9dcef);

  static const LinearGradient mainGradient = LinearGradient(
    colors: [startColor, endColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient mainGradient3 = LinearGradient(
    colors: [startColor, Color.fromARGB(255, 0, 0, 0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient mainGradient2 = LinearGradient(
    colors: [color1, color2],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Color textColor = Color(0xFF5A0530); // Màu xám đậm dễ đọc
  static const Color startColor1 = Color(0xFFebd6e3); // Màu xanh
  static const Color endColor2 = Color(0xFFd291bc); // Màu tím
  static const Color colorbackround2 = Color(0xFFD291BC);
  static const Color colorappbar = Color.fromARGB(255, 233, 166, 214);
  static const Color color1 = Color(0xFFC2649A);
  static const Color color2 = Color(0xFFE4C7B7);

  // 🎨 Màu chữ phụ (nếu cần)
  static const LinearGradient colorbackground = LinearGradient(
    colors: [startColor1, endColor2],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
