import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const ProductItem({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0), // Cách xung quanh 5px
      child: Container(
        width: 150,
        height: 150, // Hình vuông
        color: Colors.white, // Không bo góc
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 2),
            Text(
              price,
              style: TextStyle(
                fontSize: 13,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}