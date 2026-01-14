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
import '../../../../domain/entities/order/order.dart';

class OrderDetail_cs_Page extends StatefulWidget {
  final Order order;
  const OrderDetail_cs_Page({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderDetail_cs_Page> createState() => _OrderDetail_cs_PageState();
}

class _OrderDetail_cs_PageState extends State<OrderDetail_cs_Page> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ManageOrderBloc>().add(
        GetOrderDetailEvent(orderId: widget.order.orderID ?? 0),
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
              'Chi tiết đơn hàng',
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
                  itemCount: state.orderDetails.length,
                  itemBuilder: (context, index) {
                    final order = state.orderDetails[index];
                    return OrderDetailItemWidget(orderDetail: order);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Builder(
                    builder: (context) {
                      final o = widget.order;
                      final fmt = NumberFormat('#,###', 'vi_VN');
                      final subtotalNum = (o.totalAmount ?? 0).toDouble();
                      final shipping = (35000).toDouble();
                      final discount = (o.discountAmount ?? 0).toDouble();
                      final total = (o.finalAmount ?? 0).toDouble();

                      String timeStr = '-';
                      try {
                        final dt = o.orderDate is DateTime
                            ? o.orderDate as DateTime
                            : DateTime.parse(o.orderDate?.toString() ?? '');
                        timeStr = DateFormat('dd/MM/yyyy HH:mm').format(dt);
                      } catch (_) {}
                      final address = o.addressName ?? '-';

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildRowLabelValue(
                            'Tiền hàng',
                            '${fmt.format(subtotalNum)}đ',
                          ),
                          const SizedBox(height: 8),
                          _buildRowLabelValue(
                            'Phí vận chuyển',
                            '${fmt.format(shipping)}đ',
                          ),
                          const SizedBox(height: 8),
                          _buildRowLabelValue(
                            'Giảm giá',
                            '-${fmt.format(discount)}đ',
                          ),

                          const Divider(height: 20),
                          _buildRowLabelValue(
                            'Tổng tiền',
                            '${fmt.format(total)}đ',
                            isBold: true,
                          ),
                          const SizedBox(height: 12),
                          _buildRowLabelValue('Thời gian đặt', timeStr),
                          const SizedBox(height: 6),
                          _buildRowLabelValue('Địa chỉ', address),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 26),
            ],
          );
        },
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

Widget _buildRowLabelValue(String label, String value, {bool isBold = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: Text(
            value,
            textAlign: TextAlign.right,
            softWrap: true,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );
}
