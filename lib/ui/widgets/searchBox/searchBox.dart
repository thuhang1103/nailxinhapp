import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';

class CustomSearchBox extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSubmitted;
  final VoidCallback? onSearch;
  final VoidCallback? onSearchImage;
  final String hintText;
  final FocusNode? focusNode;

  const CustomSearchBox({
    Key? key,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onSearch,
    this.onSearchImage,
    this.hintText = "Tìm kiếm sản phẩm",
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        gradient: MyColor.mainGradient,
        borderRadius: BorderRadius.circular(11),
      ),
      padding: const EdgeInsets.all(1),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              onSubmitted: (value) {
                if (onSearch != null) onSearch!();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                ), // căn giữa dọc
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ), // Bo góc cho TextField
                  borderSide: BorderSide.none, // Không viền
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: IconButton(
              icon: const Icon(
                Icons.camera_alt,
                color: Color.fromARGB(255, 65, 62, 62),
              ),
              onPressed: onSearchImage,
              splashRadius: 22,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 255, 254, 254),
            ),
            onPressed: onSearch,
          ),
        ],
      ),
    );
  }
}
