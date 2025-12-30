import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/color/mycolor.dart';
import '../../../../routers/router.dart';
import 'package:go_router/go_router.dart';
import '../../../../routers/router_path.dart';
import '../../../../features/fetch_order/fetch_order_bloc.dart';
import '../../../../features/fetch_order/fetch_order_event.dart';
import '../../../../features/fetch_order/fetch_order_state.dart';
import '../../../../domain/entities/vouchers.dart';
import 'package:intl/intl.dart';

class LoadVoucherPage extends StatefulWidget {
  const LoadVoucherPage({Key? key}) : super(key: key);

  @override
  State<LoadVoucherPage> createState() => _LoadVoucherPageState();
}

class _LoadVoucherPageState extends State<LoadVoucherPage> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FetchOrderBloc>().add(LoadVoucherEvent());
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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Chọn voucher',
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
      body: BlocBuilder<FetchOrderBloc, FetchOrderState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.vouches?.length,
                  itemBuilder: (context, index) {
                    final voucher = state.vouches?[index];
                    final isSelected = selectedIndex == index;

                    return _VoucherItem(
                      voucher: voucher,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedIndex = isSelected ? null : index;
                        });
                      },
                    );
                  },
                ),
              ),

              /// Button áp dụng
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: selectedIndex == null
                        ? null
                        : () {
                            context.read<FetchOrderBloc>().add(
                              SelectVoucherEvent(
                                state.vouches![selectedIndex!],
                              ),
                            );
                            context.pop();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColor.textColor,
                    ),
                    child: const Text(
                      'Áp dụng voucher',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _VoucherItem extends StatelessWidget {
  final Voucher? voucher;
  final bool isSelected;
  final VoidCallback onTap;

  const _VoucherItem({
    required this.voucher,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? MyColor.textColor : Colors.grey.shade300,
        ),
      ),
      child: ListTile(
        leading: Checkbox(
          value: isSelected,
          onChanged: (_) => onTap(),
          activeColor: MyColor.textColor,
        ),
        title: Text(
          voucher?.code ?? 'Voucher',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(voucher?.description ?? ''),
        trailing: Text(
          '-${NumberFormat("#,###", "vi_VN").format(voucher?.discount)}',
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
