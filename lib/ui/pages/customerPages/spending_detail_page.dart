import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../routers/router_path.dart';
//color
import '../../../core/color/mycolor.dart';
import '../../widgets/page_view/page_empty.dart';

//widgets

import '../../../features/get_spending/get_spending_bloc.dart';
import '../../../features/get_spending/get_spending_event.dart';
import '../../../features/get_spending/get_spending_state.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/spending.dart';

class SpendingDetailPage extends StatefulWidget {
  const SpendingDetailPage({super.key});

  @override
  State<SpendingDetailPage> createState() => _SpendingDetailPageState();
}

class _SpendingDetailPageState extends State<SpendingDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetSpendingBloc>().add(GetSpendingDetails());
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
            'Chi Tiêu trong năm',
            style: TextStyle(color: MyColor.textColor, fontSize: 20),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: MyColor.textColor),
      ),
      body: BlocBuilder<GetSpendingBloc, GetSpendingState>(
        builder: (context, state) {
          final rawList = (state.monthly);
          final List<MonthlySpending> items = rawList;

          if (items.isEmpty) {
            return const EmptyView(
              message: 'Chưa có dữ liệu chi tiêu trong năm nay.',
            );
          }

          final fmt = NumberFormat('#,###', 'vi_VN');
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final s = items[index];

              final int year = s.year;

              final int month = s.month;
              final double total = s.totalSpending;

              String monthLabel = '$month/$year';
              try {
                final dt = DateTime(year, month == 0 ? 1 : month);
                monthLabel = DateFormat('MMMM yyyy', 'vi_VN').format(dt);
              } catch (_) {}

              final totalStr = '${fmt.format(total)} đ';

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 129, 4, 85),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    monthLabel,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Tháng $month',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  trailing: Text(
                    totalStr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
