import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import '../../../../routers/router_path.dart';
import '../../../../routers/router.dart';

import '../../../../features/get_order_Customer/get_order_bloc.dart';
import '../../../../features/get_order_Customer/get_order_event.dart';
import '../../../../features/get_order_Customer/get_order_state.dart';
import '../../../../domain/entities/order/order.dart';
import 'package:intl/intl.dart';

class WaitConfirm_Cs_Page extends StatefulWidget {
  const WaitConfirm_Cs_Page({super.key});

  @override
  State<WaitConfirm_Cs_Page> createState() => _WaitConfirm_Cs_PageState();
}

class _WaitConfirm_Cs_PageState extends State<WaitConfirm_Cs_Page> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetOrderBloc>().add(GetOrder(status: 'Pending'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Đơn hàng chờ xác nhận ',
            style: TextStyle(color: MyColor.textColor, fontSize: 20),
          ),
        ),
        iconTheme: const IconThemeData(color: MyColor.textColor),
      ),
      body: BlocBuilder<GetOrderBloc, GetOrderState>(
        builder: (context, state) {
          final orders = state.orders;
          if (orders.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Không có đơn hàng',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          }
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
                      onTap: () {
                        context.push(
                          RoutePaths.orderDetailCsPage,
                          extra: order,
                        );
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
