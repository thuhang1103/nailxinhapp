import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Danh sách sản phẩm mẫu
    final List<Map<String, dynamic>> cartItems = [
      {'name': 'Sản phẩm 1', 'price': 100000},
      {'name': 'Sản phẩm 2', 'price': 150000},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Giỏ hàng của bạn đang trống'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Giá: ${item['price']}đ'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Xử lý xóa sản phẩm khỏi giỏ hàng
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Xử lý thanh toán
          },
          child: const Text('Thanh toán'),
        ),
      ),
    );
  }
}