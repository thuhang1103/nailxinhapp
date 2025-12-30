import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';

class AppErrorPage extends StatelessWidget {
  final String title;
  final String message;
  final String primaryButtonLabel;
  final String? secondaryButtonLabel;
  final IconData icon;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;

  const AppErrorPage({
    super.key,
    this.title = "Đã xảy ra lỗi",
    this.message = "Vui lòng thử lại sau.",
    this.primaryButtonLabel = "Quay lại",
    this.secondaryButtonLabel,
    this.icon = Icons.error_outline,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        title: const Text('Xảy Ra Lỗi'),
        backgroundColor: Colors.red.shade400,
        elevation: 6.0, // độ cao shadow
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 80, color: Colors.red.shade400),
              const SizedBox(height: 16),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),

              const SizedBox(height: 24),

              // Primary button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPrimaryPressed ?? () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(primaryButtonLabel),
                ),
              ),

              // Secondary button (optional)
              if (secondaryButtonLabel != null) ...[
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed:
                        onSecondaryPressed ?? () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(secondaryButtonLabel!),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
