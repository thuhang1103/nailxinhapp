import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
//bloc

import '../../../features/edit_address/edit_address_bloc.dart';
import '../../../features/edit_address/edit_address_event.dart';
import '../../../features/edit_address/edit_address_state.dart';
import '../../../core/color/mycolor.dart';
import '../../../ui/widgets/address_Item.dart';

class EditDetailAddressPage extends StatefulWidget {
  const EditDetailAddressPage({super.key});

  @override
  State<EditDetailAddressPage> createState() => _EditDetailAddressPageState();
}

class _EditDetailAddressPageState extends State<EditDetailAddressPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EditAddressBloc>().add(GetAddressEvent());
    });
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
                  // TODO: mở màn edit
                  // context.push(RoutePaths.editAddressForm, extra: address);
                },
                onDelete: () {
                  context.read<EditAddressBloc>().add(
                    DeleteAddressEvent(addressId: address.id!),
                  );
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
