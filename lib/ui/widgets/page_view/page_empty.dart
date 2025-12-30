import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? onPressed;

  const EmptyView({
    super.key,
    required this.message,
    this.buttonText = 'Tiếp tục',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 12),
          if (onPressed != null)
            ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
        ],
      ),
    );
  }
}
