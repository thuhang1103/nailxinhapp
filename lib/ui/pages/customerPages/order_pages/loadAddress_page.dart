import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/color/mycolor.dart';
import '../../../../routers/router.dart';
import 'package:go_router/go_router.dart';
import '../../../../routers/router_path.dart';
import '../../../../features/fetch_order/fetch_order_bloc.dart';
import '../../../../features/fetch_order/fetch_order_event.dart';
import '../../../../features/fetch_order/fetch_order_state.dart';
import '../../../../domain/entities/address/address.dart';
import 'package:intl/intl.dart';

class LoadAddressPage extends StatefulWidget {
  const LoadAddressPage({Key? key}) : super(key: key);

  @override
  State<LoadAddressPage> createState() => _LoadAddressPageState();
}

class _LoadAddressPageState extends State<LoadAddressPage> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FetchOrderBloc>().add(LoadAddressEvent());
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
              'Chọn địa chỉ',
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
                  itemCount: state.addresses?.length,
                  itemBuilder: (context, index) {
                    final address = state.addresses?[index];
                    final isSelected = selectedIndex == index;

                    return _AddressItem(
                      address: address,
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
                              SelectAddressEvent(
                                state.addresses![selectedIndex!],
                              ),
                            );
                            context.pop();
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColor.textColor,
                    ),
                    child: const Text(
                      'xác nhận',
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

class _AddressItem extends StatelessWidget {
  final Address? address;
  final bool isSelected;
  final VoidCallback onTap;

  const _AddressItem({
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final phone = address?.phone ?? 'Chưa có số';
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
          address?.name ?? 'Địa chỉ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(address?.fullAddress ?? ''),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(Icons.phone, size: 16, color: Colors.grey),
            const SizedBox(height: 4),
            Text(
              phone,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
