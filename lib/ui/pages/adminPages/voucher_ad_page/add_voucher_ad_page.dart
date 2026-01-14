import 'package:flutter/material.dart';

//router
import 'package:go_router/go_router.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../feature_admin/manage_voucher/manage_voucher_bloc.dart';
import '../../../../feature_admin/manage_voucher/manage_voucher_event.dart';
import '../../../../feature_admin/manage_voucher/manage_voucher_state.dart';
import '../../../../ui/widgets/page_view/page_loading.dart';
//voucher
import '../../../../domain/entities/vouchers.dart';
import '../../../../core/color/mycolor.dart';
import '../../../../ui/widgets/voucher/voucher_container_ad.dart';
import 'package:intl/intl.dart';

class CreateVoucherPage extends StatefulWidget {
  const CreateVoucherPage({Key? key}) : super(key: key);

  @override
  State<CreateVoucherPage> createState() => _CreateVoucherPageState();
}

class _CreateVoucherPageState extends State<CreateVoucherPage> {
  final DateFormat df = DateFormat('dd/MM/yyyy');
  final _startDateCtrl = TextEditingController();
  final _endDateCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.colorappbar,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(color: MyColor.colorappbar),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: MyColor.textColor,
                ),
                onPressed: () => Navigator.pop(context),
                iconSize: 19,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Tạo Mã Giảm Giá',
                style: TextStyle(color: MyColor.textColor, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ManageVoucherBloc, ManageVoucherState>(
        builder: (context, state) {
          _startDateCtrl.text = state.startDate != null
              ? df.format(state.startDate!)
              : '';
          _endDateCtrl.text = state.endDate != null
              ? df.format(state.endDate!)
              : '';

          final codeValue = state.code ?? '';
          final descValue = state.description ?? '';
          final minOrderValue = state.minOrderValue?.toString() ?? '';
          final discountValue = state.discountAmount?.toString() ?? '';
          final startDate = state.startDate ?? DateTime.now();
          final endDate = state.endDate ?? DateTime.now();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  initialValue: codeValue,
                  decoration: const InputDecoration(labelText: 'Mã voucher'),
                  onChanged: (v) =>
                      context.read<ManageVoucherBloc>().add(ChangeCodeEvent(v)),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: descValue,
                  decoration: const InputDecoration(labelText: 'Mô tả'),
                  maxLines: 2,
                  onChanged: (v) => context.read<ManageVoucherBloc>().add(
                    ChangeDescriptionEvent(v),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: minOrderValue,
                  decoration: const InputDecoration(
                    labelText: 'Giá trị tối thiểu đơn hàng',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    final d = double.tryParse(v) ?? 0;
                    context.read<ManageVoucherBloc>().add(
                      ChangeMinOrderValueEvent(d),
                    );
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: discountValue,
                  decoration: const InputDecoration(labelText: 'Số tiền giảm'),
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    final d = double.tryParse(v) ?? 0;
                    context.read<ManageVoucherBloc>().add(
                      ChangeDiscountAmountEvent(d),
                    );
                  },
                ),
                const SizedBox(height: 8),

                // start date (readOnly) -> pick date
                TextFormField(
                  controller: _startDateCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Ngày bắt đầu',
                    hintText: startDate != null ? df.format(startDate) : '',
                  ),
                  onTap: () async {
                    final initial = startDate ?? DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: initial,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      context.read<ManageVoucherBloc>().add(
                        ChangeStartDateEvent(picked),
                      );
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  readOnly: true,
                  controller: _endDateCtrl,
                  decoration: InputDecoration(
                    labelText: 'Ngày kết thúc',
                    hintText: endDate != null ? df.format(endDate) : '',
                  ),
                  onTap: () async {
                    final initial = endDate ?? DateTime.now();
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: initial,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      context.read<ManageVoucherBloc>().add(
                        ChangeEndDateEvent(picked),
                      );
                    }
                  },
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<ManageVoucherBloc>().add(
                            CreateVoucherEvent(),
                          );
                        },
                        child: const Text(
                          'xác nhận',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            102,
                            13,
                            71,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
