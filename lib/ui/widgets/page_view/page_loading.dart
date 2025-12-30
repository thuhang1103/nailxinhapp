import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({this.size = 40.0, this.color, super.key});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return _LoadingView(size: size, color: color);
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({this.size = 40.0, this.color, super.key});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final indicatorColor = color ?? const Color.fromARGB(255, 240, 236, 215);
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          color: indicatorColor,
        ),
      ),
    );
  }
}
