import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color/mycolor.dart';
import '../../../routers/router.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/cart_item.dart';

import '../../../ui/widgets/cart_item.dart';
//router
import '../../../routers/router.dart';
import '../../../routers/router_path.dart';
//bloc event state
import '../../../features/fetch_cartItem/cart_item_bloc.dart';
import '../../../features/fetch_cartItem/cart_item_event.dart';
import '../../../features/fetch_cartItem/cart_item_state.dart';
//page view
import '../../widgets/page_view/page_loading.dart';
import '../../widgets/page_view/page_error.dart';
import '../../widgets/page_view/page_empty.dart';
import '../../widgets/button/button_gradient.dart';
import 'package:intl/intl.dart';
import '../../pages/customerPages/voucher_page.dart';

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
    context.read<CartItemBloc>().uiEvents.listen((msg) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
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
        title: BlocBuilder<CartItemBloc, CartItemState>(
          builder: (context, state) {
            final count = state.cartItems.length;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Giỏ hàng',
                  style: TextStyle(
                    color: MyColor.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                if (count > 0)
                  Text(
                    '($count)',
                    style: const TextStyle(
                      color: MyColor.textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            );
          },
        ),
        centerTitle: true,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline_sharp),
            color: MyColor.textColor,
            tooltip: 'Chat hỗ trợ',
            onPressed: () {
              context.push(RoutePaths.chatPage);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<CartItemBloc, CartItemState>(
        builder: (context, state) {
          return state.cartItemState.maybeWhen(
            loading: () => const LoadingView(),
            error: (e) => ErrorView(
              message: e.toString(),
              onRetry: () =>
                  context.read<CartItemBloc>().add(GetCartItemEvent()),
            ),
            success: (data) {
              if (state.cartItems.isEmpty) {
                return EmptyView(
                  message: 'Giỏ hàng của bạn đang trống',
                  buttonText: 'Tiếp tục mua sắm',
                  onPressed: () => context.push(RoutePaths.shoppingPage),
                );
              }

              return _CartListView(items: state.cartItems);
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartItemBloc, CartItemState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

            child: Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: state.isSelectAll == 1,
                      activeColor: const Color.fromARGB(255, 234, 132, 202),
                      checkColor: Colors.white,
                      onChanged: (value) {
                        context.read<CartItemBloc>().add(
                          SelectAllCartItemsEvent(),
                        );
                      },
                    ),
                    const Text(
                      "Tất cả",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // ---- 2. TỔNG TIỀN ----
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Tổng:", style: TextStyle(fontSize: 13)),
                    Text(
                      "${NumberFormat.currency(locale: 'vi_VN', symbol: '').format(state.totalPrice)} đ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 12),

                // ---- 3. NÚT THANH TOÁN ----
                SizedBox(
                  height: 35,
                  width: 110, // quan trọng!
                  child: ButtonGradient(
                    text: 'Đặt Hàng',
                    onPressed: () {
                      context.push(RoutePaths.confirmOrder);
                    },
                    height: 35,
                    gradient: MyColor.mainGradient2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CartListView extends StatelessWidget {
  final List<CartItem> items;

  const _CartListView({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = items[index];

        return Card(
          child: CartItemWidget(
            isSelected: (item.isSelected ?? 0) == 1,
            imageUrl: item.imagePath ?? '',
            name: item.productName ?? 'Sản phẩm',
            quantity: item.quantity ?? 1,
            price: (item.price ?? 0).toDouble(),
            stock: item.stock ?? 0,
            variant: item.variantName ?? 'mặc định',
            onSelect: (checked) {
              context.read<CartItemBloc>().add(
                ChangeIsSelectedEvent(
                  cartItemId: item.id!,
                  quantity: item.quantity ?? 1,
                  variantId: item.variantId ?? 0,
                  isSelected: checked! ? 1 : 0,
                ),
              );
            },
            onDiscount: () {
              context.push(RoutePaths.voucher);
            },
            onDecrement: () {
              if ((item.quantity ?? 1) > 1) {
                context.read<CartItemBloc>().add(
                  DecreaseQuantityEvent(cartItemId: item.id!),
                );
              }
            },
            onIncrement: () {
              if ((item.quantity ?? 1) < item.stock!) {
                context.read<CartItemBloc>().add(
                  IncreaseQuantityEvent(
                    cartItemId: item.id!,
                    stock: item.stock ?? 1,
                  ),
                );
              }
            },
            onRemove: () {
              context.read<CartItemBloc>().add(
                DeleteCartItemEvent(cartItemId: item.id!),
              );
            },
          ),
        );
      },
    );
  }
}
