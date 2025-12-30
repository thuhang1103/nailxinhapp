import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';

class Revenue extends StatelessWidget {
  const Revenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: const Text(
          'NailXinh',
          style: TextStyle(
            color: MyColor.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 4 ô vuông - dùng height cố định khi ở trong SingleChildScrollView
              SizedBox(
                height: 320, // chỉnh theo thiết kế / màn hình
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    RevenueBox(title: 'Doanh thu tháng', value: '3,000,000 đ'),
                    RevenueBox(title: 'Doanh thu ngày', value: '500,000 đ'),
                    RevenueBox(title: 'Doanh thu quý', value: '10,000,000 đ'),
                    RevenueBox(title: 'Doanh thu năm', value: '16,000,000 đ'),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Text(
                'Doanh thu 6 tháng gần đây',
                style: TextStyle(fontSize: 18, color: MyColor.textColor),
              ),
              const SizedBox(height: 10),

              // Biểu đồ 6 mốc cố định (height cố định)
              SizedBox(
                height: 300, // chỉnh theo thiết kế / màn hình
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CustomPaint(
                    painter: LineChartPainter(),
                    child: Container(),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Container chứa thông tin text
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Text(
                  'doanh thu tăng 30% so với tháng trước',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RevenueBox extends StatelessWidget {
  final String title;
  final String value;

  const RevenueBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [MyColor.startColor, Color.fromARGB(246, 20, 6, 13)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Painter biểu đồ đơn giản 6 điểm
class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final paintPoint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // 6 điểm cố định
    final points = [
      Offset(size.width * 0.05, size.height * 0.8),
      Offset(size.width * 0.2, size.height * 0.6),
      Offset(size.width * 0.35, size.height * 0.7),
      Offset(size.width * 0.5, size.height * 0.4),
      Offset(size.width * 0.7, size.height * 0.5),
      Offset(size.width * 0.9, size.height * 0.3),
    ];

    // Vẽ đường nối
    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, paintLine);

    // Vẽ điểm
    for (final point in points) {
      canvas.drawCircle(point, 4, paintPoint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
