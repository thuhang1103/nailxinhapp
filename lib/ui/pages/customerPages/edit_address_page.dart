import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../routers/router_path.dart';
//bloc

import '../../../features/edit_address/edit_address_bloc.dart';
import '../../../features/edit_address/edit_address_event.dart';
import '../../../features/edit_address/edit_address_state.dart';
import '../../../core/color/mycolor.dart';
import '../../../ui/widgets/address_Item.dart';
import 'dart:async';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({super.key});

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  late StreamSubscription<String> _uiSub;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EditAddressBloc>().add(GetAddressEvent());
    });
    _uiSub = context.read<EditAddressBloc>().uiEvents.listen((msg) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    });
  }

  @override
  void dispose() {
    _uiSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        backgroundColor: MyColor.pinkColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: MyColor.textColor,
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Địa chỉ',
          style: TextStyle(
            color: MyColor.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),

      body: BlocBuilder<EditAddressBloc, EditAddressState>(
        builder: (context, state) {
          final addresses = state.addresses ?? [];

          if (addresses.isEmpty) {
            return const Center(child: Text('Chưa có địa chỉ nào'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: addresses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final address = addresses[index];

              return AddressItem(
                address: address,
                onEdit: () {
                  context.push(RoutePaths.editDetailAddress);
                },
                onDelete: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Xác nhận xoá'),
                      content: const Text('Bạn có chắc muốn xoá địa chỉ này?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(false),
                          child: const Text('Huỷ'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(true),
                          child: const Text(
                            'Xoá',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true) {
                    context.read<EditAddressBloc>().add(
                      DeleteAddressEvent(addressId: address.id!),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đã gửi yêu cầu xoá')),
                    );
                  }
                },
              );
            },
          );
        },
      ),

      // NÚT + THÊM ĐỊA CHỈ
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          context.read<EditAddressBloc>().add(AddAddressEvent());
        },
        child: const Icon(Icons.add, color: Colors.pink),
      ),
    );
  }
}
