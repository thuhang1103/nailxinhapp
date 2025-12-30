import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import '../../../../routers/router_path.dart';
import '../../../../routers/router.dart';
//button
import '../../../widgets/button/button_gradient.dart';
//chart
import '../../../widgets/chart/simpleLineChart.dart';

class SpendingPage extends StatefulWidget {
  const SpendingPage({super.key});

  @override
  State<SpendingPage> createState() => _SpendingPageState();
}

class _SpendingPageState extends State<SpendingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Chi Tiêu Của Bạn',
            style: TextStyle(color: MyColor.textColor, fontSize: 20),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: MyColor.textColor),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: điều hướng sang trang cài đặt
              // context.go(RoutePaths.settings);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1) Container: avatar + name
            SizedBox(
              height: 100, // chỉnh chiều cao tổng cho 2 ô
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: MyColor.mainGradient3,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Số đơn',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '35',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'đơn/tháng',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: MyColor.mainGradient3,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Chi tiêu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '2.300.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'đ/tháng',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Divider giữa các section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: Colors.white70, // hoặc Colors.grey[300] tùy nền
                thickness: 1.0,
                height: 1.0,
              ),
            ),

            const SizedBox(height: 12),

            // 2) Container: info (email, sdt, thứ hạng) + nút chỉnh sửa top-right
            SizedBox(
              height: 100, // chỉnh chiều cao tổng cho 2 ô
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: MyColor.mainGradient3,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Số đơn',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '35',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'đơn/tháng',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          gradient: MyColor.mainGradient3,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Chi tiêu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '2.300.000',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'đ/tháng',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Divider giữa các section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: Colors.white70, // hoặc Colors.grey[300] tùy nền
                thickness: 1.0,
                height: 1.0,
              ),
            ),

            const SizedBox(height: 12),

            // 3) Container: hàng 3 ô vuông
            SizedBox(
              height: 54, // chỉnh chiều cao tổng cho 2 ô
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: ButtonGradient(
                        text: 'thống kê\nchi tiết',
                        onPressed: () {
                          context.push(RoutePaths.getPointDaily);
                        },
                        // cho rộng tối đa trong Expanded, chiều cao phù hợp
                        width: double.infinity,
                        height: 84,
                        borderRadius: 12,
                        gradient: MyColor.mainGradient2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: ButtonGradient(
                        text: 'lịch sử mua sắm',
                        onPressed: () {
                          context.push(RoutePaths.spending);
                        },
                        width: double.infinity,
                        height: 84,
                        borderRadius: 12,
                        gradient: MyColor.mainGradient2,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Divider giữa các section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: Colors.white70, // hoặc Colors.grey[300] tùy nền
                thickness: 1.0,
                height: 1.0,
              ),
            ),

            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Biểu đồ chi tiêu 6 tháng gần nhất',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                SimpleLineChart(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
