import 'package:flutter/material.dart';
import '../../../core/color/mycolor.dart';

//router
import 'package:go_router/go_router.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/fetch_Voucher/fetch_voucher_bloc.dart';
import '../../../features/fetch_Voucher/fetch_voucher_state.dart';

import '../../../features/fetch_Voucher/fetch_voucher_event.dart';
import '../../../ui/widgets/page_view/page_loading.dart';
import '../../widgets/voucher/voucher_container.dart';
//voucher
import '../../../domain/entities/vouchers.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  @override
  void initState() {
    super.initState();

    context.read<VoucherBloc>().add(FetchVoucherEvent());
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
                'Mã Giảm Giá',
                style: TextStyle(color: MyColor.textColor, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<VoucherBloc, VoucherState>(
        builder: (context, state) {
          return state.voucherState.maybeWhen(
            loading: () => LoadingView(),
            error: (message) => Center(child: Text('Error: $message')),
            orElse: () {
              final maxV = state.maxVoucher;
              final list = state.vouchers;
              if ((list == null) || list.isEmpty) {
                return const Center(child: Text('Không có voucher nào'));
              }
              return Column(
                children: [
                  if (maxV != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Voucher nổi bật',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          VoucherContainer(
                            Discount: maxV.discount.toString(),
                            minValue: maxV.minOrderValue.toString(),
                            startTime: maxV.startTime ?? DateTime.now(),
                            endTime:
                                maxV.endTime ??
                                DateTime.now().add(const Duration(days: 30)),
                          ),
                        ],
                      ),
                    ),
                  const Divider(
                    color: Colors.white70,
                    thickness: 0.8,
                    height: 1,
                  ),
                  const SizedBox(child: Text('Danh sách voucher')),
                  const Divider(
                    color: Colors.white70,
                    thickness: 0.8,
                    height: 1,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final voucher = list[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: VoucherContainer(
                            Discount: voucher.discount.toString(),
                            minValue: voucher.minOrderValue.toString(),
                            startTime: voucher.startTime ?? DateTime.now(),
                            endTime:
                                voucher.endTime ??
                                DateTime.now().add(const Duration(days: 30)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
