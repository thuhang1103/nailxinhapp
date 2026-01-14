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
import '../../../../core/common_state.dart';
import '../../../../core/appException.dart';

class UpdateVoucherPage extends StatefulWidget {
  final Voucher voucher;

  const UpdateVoucherPage({Key? key, required this.voucher}) : super(key: key);

  @override
  State<UpdateVoucherPage> createState() => _UpdateVoucherPageState();
}

class _UpdateVoucherPageState extends State<UpdateVoucherPage> {
  final DateFormat df = DateFormat('dd/MM/yyyy');
  final _startDateCtrl = TextEditingController();
  final _endDateCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();

    context.read<ManageVoucherBloc>().add(GetInfoVoucherEvent(widget.voucher));
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
                'Cập Nhật Mã Giảm Giá',
                style: TextStyle(color: MyColor.textColor, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: BlocListener<ManageVoucherBloc, ManageVoucherState>(
        listener: (context, state) {
          if (state.updateVoucherState == const CommonState.success()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cập nhật voucher thành công')),
            );
            // close page after showing snackbar
            context.pop();
          }

          // on delete success
          if (state.deleteVoucherState == const CommonState.success()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Xóa voucher thành công')),
            );
            context.pop();
          }

          // optionally show error messages
          if (state.updateVoucherState ==
              const CommonState.error(BusinessException(''))) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Cập nhật thất bại')));
            context.pop();
          }
          if (state.deleteVoucherState ==
              const CommonState.error(BusinessException(''))) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Xóa thất bại')));
            context.pop();
          }
        },
        child: BlocBuilder<ManageVoucherBloc, ManageVoucherState>(
          builder: (context, state) {
            _startDateCtrl.text = state.startDate != null
                ? df.format(state.startDate!)
                : '';
            _endDateCtrl.text = state.endDate != null
                ? df.format(state.endDate!)
                : '';

            final codeValue = state.code ?? widget.voucher.code ?? '';
            final descValue =
                state.description ?? widget.voucher.description ?? '';
            final minOrderValue =
                state.minOrderValue?.toString() ??
                widget.voucher.minOrderValue?.toString() ??
                '';
            final discountValue =
                state.discountAmount?.toString() ??
                widget.voucher.discount?.toString() ??
                '';
            final startDate = state.startDate ?? widget.voucher.startTime;
            final endDate = state.endDate ?? widget.voucher.endTime;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  VoucherADContainer(
                    imageUrl: 'assets/icons/Abstract Shape (5).png',
                    discount: discountValue,
                    minValue: minOrderValue,
                    startTime: startDate ?? DateTime.now(),
                    endTime: endDate ?? DateTime.now(),
                  ),
                  const SizedBox(height: 12),

                  TextFormField(
                    initialValue: codeValue,
                    decoration: const InputDecoration(labelText: 'Mã voucher'),
                    onChanged: (v) => context.read<ManageVoucherBloc>().add(
                      ChangeCodeEvent(v),
                    ),
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
                    decoration: const InputDecoration(
                      labelText: 'Số tiền giảm',
                    ),
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
                              UpdateVoucherEvent(widget.voucher),
                            );
                          },
                          child: const Text(
                            'Cập nhật',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              98,
                              14,
                              69,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Xác nhận'),
                                content: const Text(
                                  'Bạn có chắc muốn xóa voucher này?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Hủy'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      context.read<ManageVoucherBloc>().add(
                                        DeleteVoucherEvent(widget.voucher),
                                      );
                                    },
                                    child: const Text(
                                      'Xóa',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Xóa'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
