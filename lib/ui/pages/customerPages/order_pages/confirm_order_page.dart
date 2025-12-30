import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/fetch_order/fetch_order_bloc.dart';
import '../../../../features/fetch_order/fetch_order_event.dart';
import '../../../../features/fetch_order/fetch_order_state.dart';
import '../../../../core/common_state.dart';
import '../../../../core/color/mycolor.dart';
import '../../../../routers/router.dart';
import '../../../../routers/router_path.dart';
import '../../../widgets/cart_item_order.dart';
//go_router
import 'package:go_router/go_router.dart';
import '../../../../domain/entities/cart_item.dart';
import 'package:intl/intl.dart';

class ConfirmOrderPage extends StatefulWidget {
  const ConfirmOrderPage({super.key});

  @override
  State<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FetchOrderBloc>().add(GetDataEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FetchOrderBloc>();
    bloc.add(GetDataEvent()); // load data khi trang mở

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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Đặt Hàng',
              style: TextStyle(
                color: MyColor.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
          ],
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
      body: BlocConsumer<FetchOrderBloc, FetchOrderState>(
        listener: (context, state) {
          state.confirmOrderState.maybeWhen(
            success: (data) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Đặt hàng thành công')),
              );
            },
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Lỗi: ${error.toString()}')),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          if (state.loadDataState is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final cartItems = state.cartitems ?? [];
          final address = state.addressDefault;
          final point = state.point?.loyaltyPoints ?? 0;
          final total = state.total;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Địa chỉ
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: address != null
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Địa chỉ nhận hàng',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: MyColor.textColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(address.fullAddress ?? ''),
                                  const SizedBox(height: 6),
                                  Text("sđt: ${address.phone ?? 'chưa có'}"),
                                ],
                              ),
                            ),
                            // nút Sửa -> chuyển sang trang chọn/sửa địa chỉ (truyền bloc để reuse)
                            IconButton(
                              onPressed: () {
                                final bloc = context.read<FetchOrderBloc>();
                                context.push(
                                  RoutePaths.loadAddress,
                                  extra: bloc,
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: MyColor.textColor,
                              ),
                              tooltip: 'Chỉnh sửa địa chỉ',
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Chưa có địa chỉ'),
                            TextButton(
                              onPressed: () {
                                final bloc = context.read<FetchOrderBloc>();
                                context.push(
                                  RoutePaths.loadAddress,
                                  extra: bloc,
                                );
                              },
                              child: const Text('Thêm địa chỉ'),
                            ),
                          ],
                        ),
                ),
                const SizedBox(height: 16),

                // Cart items
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sản phẩm',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyColor.textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 8, color: Colors.grey),
                        itemBuilder: (_, index) {
                          final item = cartItems[index] as CartItem;
                          return ConfirmOrderCartItem(item: item);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Use point
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: state.usePoint == 1,
                        onChanged: (_) {
                          bloc.add(SelectPointEvent());
                        },
                      ),
                      Text('Sử dụng điểm: '),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 191, 4, 125),
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Text(
                          '${NumberFormat("#,###", "vi_VN").format(state.point?.loyaltyPoints ?? 0)}đ',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Voucher
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.push(RoutePaths.loadVoucher, extra: bloc);
                        },
                        child: Text(
                          state.voucher == null
                              ? 'Chọn voucher'
                              : 'Thay đổi voucher',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),

                      // Hiện số tiền được giảm (nếu có)
                      Text(
                        '-${NumberFormat("#,###", "vi_VN").format(state.voucher?.discount ?? 0)}đ',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Tổng tiền
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tổng tiền sản phẩm: ${NumberFormat("#,###", "vi_VN").format(total ?? 0)}đ',
                      ),
                      Text(
                        'Voucher: ${NumberFormat("#,###", "vi_VN").format(state.voucher?.discount ?? 0)}đ',
                      ),

                      Text(
                        'Điểm tích luỹ: ${NumberFormat("#,###", "vi_VN").format(state.usePoint == 1 ? (state.point?.loyaltyPoints ?? 0) : 0)}đ',
                      ),
                      Text(
                        'Phí vận chuyển: ${NumberFormat("#,###", "vi_VN").format(35000)}đ',
                      ),
                      const Divider(
                        height: 16,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        'Tổng thanh toán: ${NumberFormat("#,###", "vi_VN").format(state.finalAmount ?? 0)}đ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Divider(
                        height: 16,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Nút xác nhận
                ElevatedButton(
                  onPressed: () {
                    bloc.add(ConfirmOrderEvent());
                    context.go(RoutePaths.successOrder);
                  },
                  child: const Text('Xác nhận đặt hàng'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
