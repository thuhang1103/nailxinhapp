import 'package:flutter/material.dart';

class SoldOutPage extends StatelessWidget {
  const SoldOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm sắp hết hàng '),
        backgroundColor: const Color.fromARGB(255, 243, 231, 238),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: const [
            InventoryCard(
              name: 'nailboxl mẫu 3',
              price: 120000,
              stock: 155,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/dff.jpg',
              isBestSeller: true,
            ),
            InventoryCard(
              name: 'nailboxl mẫu 5',
              price: 180000,
              stock: 688,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/dsf.jpg',
            ),
            InventoryCard(
              name: 'Máy hơ gel',
              price: 850000,
              stock: 330,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/dxx.jpg',
            ),
            InventoryCard(
              name: 'Cọ vẽ nail',
              price: 45000,
              stock: 250,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/frer.jpg',
            ),
            InventoryCard(
              name: 'Sticker nail',
              price: 30000,
              stock: 300,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/g.jpg',
            ),
            InventoryCard(
              name: 'Sơn gel OPI',
              price: 120000,
              stock: 155,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/dff.jpg',
              isBestSeller: true,
            ),
            InventoryCard(
              name: 'Bột nhúng SNS',
              price: 180000,
              stock: 688,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/l.jpg',
            ),
            InventoryCard(
              name: 'Máy hơ gel',
              price: 850000,
              stock: 330,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/hghfh.jpg',
            ),
            InventoryCard(
              name: 'Cọ vẽ nail',
              price: 45000,
              stock: 250,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/ghj.jpg',
            ),
            InventoryCard(
              name: 'Sticker nail',
              price: 30000,
              stock: 300,
              imageUrl:
                  'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/gg.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class InventoryCard extends StatelessWidget {
  final String name;
  final double price;
  final int stock;
  final String imageUrl;
  final bool isBestSeller;

  const InventoryCard({
    super.key,
    required this.name,
    required this.price,
    required this.stock,
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
          colors: stock == 0
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
                    stock == 0 ? 'Hết hàng' : 'Tồn kho: $stock',
                    style: TextStyle(
                      color: stock == 0 ? Colors.red : Colors.green,
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
