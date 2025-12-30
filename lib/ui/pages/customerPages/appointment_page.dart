import 'package:flutter/material.dart';
import '../../../ui/widgets/button/button_gradient.dart';
import '../../../core/color/mycolor.dart';

//router
import 'package:go_router/go_router.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.colorappbar,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(color: MyColor.colorappbar),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: MyColor.textColor,
                ),
                onPressed: () => Navigator.pop(context),
                iconSize: 19,
              ),
            ),
            Text(
              'Đặt lịch ',
              style: TextStyle(color: MyColor.textColor, fontSize: 20),
            ),
            IconButton(
              icon: const Icon(Icons.filter_list, color: MyColor.textColor),
              onPressed: () {
                // Xử lý lọc sản phẩm
              },
              iconSize: 24,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 20),
            const Text(
              'Tính năng đặt lịch đang được NailXinh phát triển!',
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
