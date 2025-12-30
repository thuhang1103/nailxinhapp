import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import '../../widgets/button/button_gradient.dart';
import 'package:go_router/go_router.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        title: const Text(
          'Trò chuyện',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: MyColor.textColor,
          ),
        ),
        backgroundColor: MyColor.pinkColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 20),
            const Text(
              'Tính năng chat đang được NailXinh phát triển!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Hãy quay lại sau nhé',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ButtonGradient(
              onPressed: () {
                context.pop();
              },
              text: 'Quay lại',
              gradient: MyColor.mainGradient2,
              borderRadius: 8,
              height: 40,
              width: 120,
            ),
          ],
        ),
      ),
    );
  }
}
