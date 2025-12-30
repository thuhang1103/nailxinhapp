import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/auth_bloc.dart';
import '../../../blocs/evens/auth_event.dart';
import '../../../blocs/states/auth_state.dart';
import 'package:go_router/go_router.dart';
import '../../../routers/router_path.dart';
//color
import '../../../core/color/mycolor.dart';
import '../../../blocs/bloc/product_bloc/search_all.dart';
import '../../../blocs/evens/product_event/search_product_event.dart';
import '../../../blocs/states/product_state/search_all_state.dart';
//widgets
import '../../widgets/product_item.dart';
import '../../widgets/button/button_gradient.dart';
import '../../widgets/page_view/page_empty.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is! Authenticated) {
          context.go(RoutePaths.login);
        }
      },
      child: Scaffold(
        backgroundColor: MyColor.pinkColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Quản Lý Đơn hàng',
              style: TextStyle(color: MyColor.textColor, fontSize: 20),
            ),
          ),

          iconTheme: const IconThemeData(color: MyColor.textColor),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // TODO: điều hướng sang trang cài đặt
                // context.go(RoutePaths.settings);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1) Container: avatar + name
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.blueAccent,
                      backgroundImage: const AssetImage('assets/icons/5.png'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('thuhang', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 4),
                          Text(
                            'Khách hàng',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 2) Container: info (email, sdt, thứ hạng) + nút chỉnh sửa top-right
              Container(
                height: 140,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // TODO: navigate to pending orders
                              // context.push(RoutePaths.orders, extra: 'pending');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // same action as InkWell tap if needed
                                      },
                                      icon: const Icon(
                                        Icons.hourglass_empty,
                                        size: 30,
                                        color: MyColor.textColor,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: -4,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Text(
                                          '2',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'Chờ xác nhận',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // TODO: navigate to shipping orders
                              // context.push(RoutePaths.orders, extra: 'shipping');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.local_shipping,
                                        size: 30,
                                        color: MyColor.textColor,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: -4,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'Đang vận chuyển',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // TODO: navigate to delivered orders
                              // context.push(RoutePaths.orders, extra: 'delivered');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.check_circle,
                                    size: 30,
                                    color: MyColor.textColor,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  'Đã nhận',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Text(
                        'đơn hàng',
                        style: TextStyle(
                          color: MyColor.textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 4) Container: tiêu đề sản phẩm + nút xem
              Divider(
                color: Colors.white.withOpacity(0.9), // màu trắng nhẹ
                thickness: 1.5, // độ dày mảnh
                height: 8, // khoảng cách theo chiều dọc
              ),
              Center(
                child: const SizedBox(
                  height: 20,
                  child: Text(
                    'Các tiện ích khác',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.9), // màu trắng nhẹ
                thickness: 1.5, // độ dày mảnh
                height: 8, // khoảng cách theo chiều dọc
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 54, // chỉnh chiều cao tổng cho 2 ô
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: ButtonGradient(
                          text: 'hỏi đáp\nvs shop',
                          onPressed: () {
                            context.push(RoutePaths.getPointDaily);
                          },
                          // cho rộng tối đa trong Expanded, chiều cao phù hợp
                          width: double.infinity,
                          height: 84,
                          borderRadius: 12,
                          gradient: MyColor.mainGradient2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: ButtonGradient(
                          text: 'săn mã giảm giá',
                          onPressed: () {
                            context.push(RoutePaths.spending);
                          },
                          width: double.infinity,
                          height: 84,
                          borderRadius: 12,
                          gradient: MyColor.mainGradient2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 54, // chỉnh chiều cao tổng cho 2 ô
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: ButtonGradient(
                          text: 'đánh giá đơn hàng',
                          onPressed: () {
                            context.push(RoutePaths.getPointDaily);
                          },
                          // cho rộng tối đa trong Expanded, chiều cao phù hợp
                          width: double.infinity,
                          height: 84,
                          borderRadius: 12,
                          gradient: MyColor.mainGradient2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: ButtonGradient(
                          text: 'đơn đã huỷ',
                          onPressed: () {
                            context.push(RoutePaths.spending);
                          },
                          width: double.infinity,
                          height: 84,
                          borderRadius: 12,
                          gradient: MyColor.mainGradient2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 54, // chỉnh chiều cao tổng cho 2 ô
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: ButtonGradient(
                          text: 'kiến thức ngành Nail',
                          onPressed: () {
                            context.push(RoutePaths.getPointDaily);
                          },
                          // cho rộng tối đa trong Expanded, chiều cao phù hợp
                          width: double.infinity,
                          height: 84,
                          borderRadius: 12,
                          gradient: MyColor.mainGradient2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: ButtonGradient(
                          text: 'lịch sử mua sắm',
                          onPressed: () {
                            context.push(RoutePaths.spending);
                          },
                          width: double.infinity,
                          height: 84,
                          borderRadius: 12,
                          gradient: MyColor.mainGradient2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
