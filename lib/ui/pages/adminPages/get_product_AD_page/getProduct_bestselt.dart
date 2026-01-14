import 'package:flutter/material.dart';

class BestSellerPage extends StatelessWidget {
  const BestSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩmn bán chạy '),
        backgroundColor: const Color.fromARGB(255, 243, 231, 238),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: const [
            InventoryCard2(
              name: 'NailBoxl móng nhọn',
              price: 120000,
              sold: 433,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/dff.jpg',
              isBestSeller: true,
            ),
            InventoryCard2(
              name: 'Bột nhúng SNS',
              price: 180000,
              sold: 288,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/dsf.jpg',
            ),
            InventoryCard2(
              name: 'Máy hơ gel',
              price: 850000,
              sold: 230,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/dxx.jpg',
            ),
            InventoryCard2(
              name: 'Cọ vẽ nail',
              price: 45000,
              sold: 210,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/frer.jpg',
            ),
            InventoryCard2(
              name: 'Sticker nail',
              price: 30000,
              sold: 200,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/g.jpg',
            ),
            InventoryCard2(
              name: 'Sơn gel OPI',
              price: 100000,
              sold: 100,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/dff.jpg',
              isBestSeller: true,
            ),
            InventoryCard2(
              name: 'Bột nhúng SNS',
              price: 180000,
              sold: 88,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/l.jpg',
            ),
            InventoryCard2(
              name: 'Máy hơ gel',
              price: 850000,
              sold: 30,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/hghfh.jpg',
            ),
            InventoryCard2(
              name: 'Cọ vẽ nail',
              price: 45000,
              sold: 50,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/ghj.jpg',
            ),
            InventoryCard2(
              name: 'Sticker nail',
              price: 30000,
              sold: 30,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/gg.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class InventoryCard2 extends StatelessWidget {
  final String name;
  final double price;
  final int sold;
  final String imageUrl;
  final bool isBestSeller;

  const InventoryCard2({
    super.key,
    required this.name,
    required this.price,
    required this.sold,
    required this.imageUrl,
    this.isBestSeller = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: sold == 0
              ? [Colors.grey.shade300, Colors.grey.shade200]
              : [const Color(0xFFFFD1E8), const Color(0xFFFFF0F7)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(16),
            ),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          // INFO
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (isBestSeller)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Bán chạy',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text('Giá: ${price.toStringAsFixed(0)} đ'),
                  const SizedBox(height: 4),
                  Text(
                    sold == 0 ? 'Hết hàng' : 'đã bán: $sold',
                    style: TextStyle(
                      color: sold == 0 ? Colors.red : Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
