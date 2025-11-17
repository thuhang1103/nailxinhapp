import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final double price;
  final int soldCount;
  final double score;
  final String address;
  final VoidCallback? onTap;

  const ProductItem({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.price,
    this.score = 4,
    this.soldCount = 0, // Mặc định là 0
    this.address = 'TP.Hồ Chí Minh', // Mặc định là TP.Hồ Chí Minh
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 17, 17, 17).withOpacity(0.08),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // căn trái toàn bộ
          children: [
            AspectRatio(
              aspectRatio: 1, // Luôn là hình vuông
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Nếu muốn bo góc
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 4),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 4, 4, 4),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${NumberFormat("#,###", "vi_VN").format(price)} đ',
                    style: TextStyle(
                      fontSize: 13,
                      color: const Color.fromARGB(255, 180, 40, 40),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 14,
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 247, 241, 205),
                          border: Border.all(color: Colors.orange, width: 0.5),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 12,
                              color: const Color.fromARGB(255, 246, 212, 23),
                            ),
                            SizedBox(width: 2),
                            Text(
                              score.toString(),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 29, 27, 27),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4),
                      Container(width: 1, height: 12, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Đã bán: $soldCount',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 7, 6, 6),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey),
                      SizedBox(width: 2),
                      Text(
                        address,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 70, 70, 70),
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
