import 'package:flutter/material.dart';
import '../../../core/color/mycolor.dart';

class ErrorView extends StatelessWidget {
  final String? message;
  final String buttonLabel;
  final VoidCallback? onRetry;
  final IconData? icon;

  const ErrorView({
    this.message,
    this.buttonLabel = 'Thử lại',
    this.onRetry,
    this.icon = Icons.error_outline,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 44, color: const Color.fromARGB(255, 164, 163, 163)),
          const SizedBox(height: 12),
          Text(
            message ?? 'Đã có lỗi xảy ra',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: onRetry,
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 251, 251, 251),
              side: BorderSide(color: const Color.fromARGB(255, 77, 74, 77)),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonLabel,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
