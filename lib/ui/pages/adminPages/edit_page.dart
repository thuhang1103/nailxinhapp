import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  const Edit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Trang Chỉnh sửa',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}