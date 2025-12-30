import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/color/mycolor.dart';
import '../../../../routers/router_path.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.pinkColor,
        centerTitle: true,
        elevation: 0.5,
        title: const Text(
          'Đặt hàng thành công',
          style: TextStyle(
            color: MyColor.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline_sharp),
            color: MyColor.textColor,
            onPressed: () => context.push(RoutePaths.chatPage),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Icon success
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                size: 64,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 24),

            /// Title
            const Text(
              'Đặt hàng thành công!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyColor.textColor,
              ),
            ),

            const SizedBox(height: 12),

            /// Description
            Text(
              'Đơn hàng của bạn đã được ghi nhận.\nChúng tôi sẽ xử lý và giao hàng trong thời gian sớm nhất.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),

            const SizedBox(height: 24),

            /// Order code (optional)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Mã đơn hàng: #ORD123456',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 40),

            /// Button quay về thanh toán / đơn hàng
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColor.textColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  /// về trang thanh toán / order
                  context.go(RoutePaths.home);
                },
                child: const Text(
                  'tiếp tục mua sắm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
