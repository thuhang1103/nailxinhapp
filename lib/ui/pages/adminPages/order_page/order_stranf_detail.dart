import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../feature_admin/manage_order/manage_order_bloc.dart';
import '../../../../feature_admin/manage_order/manage_order_event.dart';
import '../../../../feature_admin/manage_order/manage_order_state.dart';
import '../../../../core/color/mycolor.dart';
import '../../../../routers/router.dart';
//path
import '../../../../routers/router_path.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/entities/order/order_detail.dart';

class OrderTransportDetailPage extends StatefulWidget {
  final int orderId;
  const OrderTransportDetailPage({Key? key, required this.orderId})
    : super(key: key);

  @override
  State<OrderTransportDetailPage> createState() =>
      _OrderTransportDetailPageState();
}

class _OrderTransportDetailPageState extends State<OrderTransportDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ManageOrderBloc>().add(
        GetOrderDetailEvent(orderId: widget.orderId),
      );
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
            color: MyColor.textColor,
            onPressed: () {
              context.pop();
            },
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Đơn hàng đang vận chuyển',
              style: TextStyle(color: MyColor.textColor, fontSize: 20),
            ),
            SizedBox(width: 8),
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
      body: BlocListener<ManageOrderBloc, ManageOrderState>(
        listener: (context, state) {
          // listen updateOrderState (CommonState) and show snackbar on events
          state.updateOrderState.maybeWhen(
            loading: () {},
            success: (data) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Cập nhật thành công')),
                );
              context.pop(true);
            },
            error: (err) {
              final msg = err?.toString() ?? 'Có lỗi xảy ra';
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('Lỗi: $msg')));
            },
            orElse: () {},
          );

          // optionally listen for getOrderDetailState to show loading/error
          state.getOrderDetailState.maybeWhen(
            loading: () {},
            error: (err) {
              final msg = err?.toString() ?? 'Lỗi tải chi tiết';
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(msg)));
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<ManageOrderBloc, ManageOrderState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.orderDetails.length,
                    itemBuilder: (context, index) {
                      final order = state.orderDetails[index];
                      return OrderDetailItemWidget(orderDetail: order);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Gọi event update cho order này
                    context.read<ManageOrderBloc>().add(
                      UpdateOrderEvent(
                        orderId: widget.orderId ?? 0,
                        status: 'Complete',
                      ),
                    );
                  },
                  child: const Text('Cập nhật trạng thái'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class OrderDetailItemWidget extends StatelessWidget {
  final OrderDetail orderDetail;

  const OrderDetailItemWidget({required this.orderDetail, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = orderDetail.productName ?? '-';
    final variant = orderDetail.variantName ?? '';
    final image = orderDetail.imagePath ?? '';
    final qty = orderDetail.quantity ?? 0;
    final price = (orderDetail.price ?? 0).toDouble();
    final total = (orderDetail.total ?? (qty * price)).toDouble();

    final priceFmt = NumberFormat("#,###", "vi_VN").format(price);
    final totalFmt = NumberFormat("#,###", "vi_VN").format(total);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: image.isNotEmpty
                ? Image.network(
                    image,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 64,
                      height: 64,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  )
                : Container(
                    width: 64,
                    height: 64,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
          ),
          const SizedBox(width: 12),

          // info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (variant.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      variant,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '$qty x $priceFmtđ',
                      style: const TextStyle(fontSize: 13),
                    ),
                    const Spacer(),
                    Text(
                      '$totalFmtđ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
