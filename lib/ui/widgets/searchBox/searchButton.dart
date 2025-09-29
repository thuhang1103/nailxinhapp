import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String hintText;

  const SearchButton({
    Key? key,
    this.onTap,
    this.hintText = "Tìm kiếm sản phẩm...",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: MyColor.mainGradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 40,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                hintText,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
