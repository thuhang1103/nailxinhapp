import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchBox({Key? key, required this.controller, required this.onSearch})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        gradient: MyColor.mainGradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              cursorHeight: 15, // Chiều cao con trỏ (điều chỉnh cho vừa khung)
              cursorWidth: 2,
              decoration: InputDecoration(
                labelText: 'Search', // Đây là phần sẽ đẩy lên khi focus
                floatingLabelBehavior:
                    FloatingLabelBehavior.auto, // Tự động đẩy lên khi focus
                filled: true, // Bật chế độ nền
                fillColor: Colors.white, // Nền trắng
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.white, // Viền không màu
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey.shade700),
            onPressed: onSearch,
          ),
        ],
      ),
    );
  }
}
