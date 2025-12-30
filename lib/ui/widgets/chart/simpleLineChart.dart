import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  const SimpleLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: CustomPaint(
        painter: LineChartPainter(
          values: [2, 4, 3, 5, 1, 4], // 6 điểm lên xuống
        ),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> values;

  LineChartPainter({required this.values});

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final paintDot = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final paintGrid = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    final maxValue = values.reduce((a, b) => a > b ? a : b);
    final minValue = values.reduce((a, b) => a < b ? a : b);

    final padding = 16.0;
    final chartWidth = size.width - padding * 2;
    final chartHeight = size.height - padding * 2;

    // Vẽ grid ngang (3 đường)
    for (int i = 0; i <= 3; i++) {
      final y = padding + chartHeight * i / 3;
      canvas.drawLine(
        Offset(padding, y),
        Offset(size.width - padding, y),
        paintGrid,
      );
    }

    final path = Path();

    for (int i = 0; i < values.length; i++) {
      final x = padding + chartWidth * i / (values.length - 1);
      final y =
          padding +
          chartHeight * (1 - (values[i] - minValue) / (maxValue - minValue));

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      // Vẽ điểm tròn
      canvas.drawCircle(Offset(x, y), 4, paintDot);
    }

    // Vẽ đường
    canvas.drawPath(path, paintLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
