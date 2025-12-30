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
import '../../../../routers/router_name.dart';
import 'package:go_router/go_router.dart';
import '../../../../domain/entities/order/order.dart';

class OrderTransportPage extends StatefulWidget {
  const OrderTransportPage({Key? key}) : super(key: key);

  @override
  State<OrderTransportPage> createState() => _OrderTransportPageState();
}

class _OrderTransportPageState extends State<OrderTransportPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ManageOrderBloc>().add(GetOrderEvent(status: 'Transport'));
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
            onPressed: () => context.pop(),
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
      body: BlocBuilder<ManageOrderBloc, ManageOrderState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    final order = state.orders[index];
                    return OrderItemWidget(
                      order: order,
                      onTap: () async {
                        final result = await context.push(
                          RoutePaths.transportOrderDetail,
                          extra: order.orderID,
                        );
                        if (result == true) {
                          context.read<ManageOrderBloc>().add(
                            GetOrderEvent(status: 'Transport'),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;

  const OrderItemWidget({required this.order, required this.onTap, Key? key})
    : super(key: key);

  String _formatDate(dynamic v) {
    if (v == null) return '-';
    if (v is DateTime) return DateFormat('dd/MM/yyyy HH:mm').format(v);
    try {
      return DateFormat(
        'dd/MM/yyyy HH:mm',
      ).format(DateTime.parse(v.toString()));
    } catch (_) {
      return v.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = order.orderID ?? '';
    final addressName = order.addressName ?? '';
    final created = _formatDate(order.orderDate ?? '');
    final total = (order.finalAmount ?? 0).toDouble();

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: MyColor.textColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mã đơn hàng: ${id.toString()}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(addressName.toString()),
                  const SizedBox(height: 6),
                  Text(
                    'Thời gian: $created',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              NumberFormat("#,###", "vi_VN").format(total) + 'đ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 6),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
