import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color/mycolor.dart';
import '../../../routers/router.dart';
import 'package:go_router/go_router.dart';

import '../../../datas/models/cart_item_model.dart';
import '../../../ui/widgets/cart_item.dart';
//bloc event state
import '../../../features/fetch_cartItem/cart_item_bloc.dart';
import '../../../features/fetch_cartItem/cart_item_event.dart';
import '../../../features/fetch_cartItem/cart_item_state.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartItemBloc>().add(GetCartItemEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        backgroundColor: MyColor.pinkColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            padding: const EdgeInsets.all(6),
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.arrow_back_ios),
            color: MyColor.textColor, // màu icon
            onPressed: () => context.pop(),
          ),
        ),
        title: Center(
          child: Text(
            'Giỏ hàng',
            style: const TextStyle(
              color: MyColor.textColor, // màu chữ
              fontSize: 18, // kích thước chữ
              fontWeight: FontWeight.w400, // độ đậm
            ),
          ),
        ),
        elevation: 0.5,
      ),
      body: BlocBuilder<CartItemBloc, CartItemState>(
        builder: (context, state) {
          // check loading / error via CommonState helpers
          final isLoading = state.cartItemState.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );
          final errorMsg = state.cartItemState.maybeWhen(
            error: (e) => e?.toString(),
            orElse: () => null,
          );

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (errorMsg != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Đã có lỗi: $errorMsg', textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<CartItemBloc>().add(GetCartItemEvent()),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state.cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Giỏ hàng của bạn đang trống'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () => context.push(RoutePaths.shopping),
                    child: const Text('Tiếp tục mua sắm'),
                  ),
                ],
              ),
            );
          }

          return SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.cartItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final item = state.cartItems[index];
                  final cartItemId = item.id ?? item.id;
                  final isSelected = (item.isSelected ?? 0) == 1;
                  final qty = item.quantity ?? 1;
                  final price = (item.total ?? item.price ?? 0).toDouble();
                  final image =
                      (item.imagePath ?? item.imagePath ?? '') as String;
                  final name = item.productName ?? 'Sản phẩm';
                  final category = item.category ?? '';

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CartItem(
                        isSelected: isSelected,
                        imageUrl: image,
                        name: name,
                        category: category,
                        quantity: qty,
                        price: price,
                        onEdit: () {
                          // mở modal chỉnh sửa nếu cần
                        },
                        onDiscount: () {
                          // xử lý áp dụng mã giảm giá
                        },
                        onSelect: (checked) {
                          final newVal = (checked ?? false) ? 1 : 0;
                          context.read<CartItemBloc>().add(
                            ChangeIsSelectedEvent(
                              cartItemId: cartItemId,
                              quantity: qty,
                              isSelected: newVal,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
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
