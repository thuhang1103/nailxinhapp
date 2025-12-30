import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import '../../widgets/categorybutton.dart';
import '../../widgets/order_button.dart';
import '../../../routers/router.dart';
import '../../../routers/router_path.dart';
import 'package:nailxinh/ui/widgets/button/button_gradient.dart';
//go
import 'package:go_router/go_router.dart';

class Management extends StatefulWidget {
  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  void onNailPressed() {}

  void onThietBiNailPressed() {}

  void onNailBoxPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        backgroundColor: MyColor.pinkColor,

        title: Text(
          'NailXinh',
          style: TextStyle(
            color: MyColor.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Quản lý đơn hàng',
                    style: TextStyle(fontSize: 18, color: MyColor.textColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(121, 30, 12, 12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderStatusButton(
                        imageAsset:
                            'assets/images/Screenshot 2025-12-29 at 20.01.24.png',
                        text: 'Chờ xác nhận',
                        onPressed: () {
                          context.push(RoutePaths.spendingOrder);
                        },
                      ),
                      OrderStatusButton(
                        imageAsset:
                            'assets/images/Screenshot 2025-12-29 at 20.03.56.png',
                        text: 'Chờ vận chuyển',
                        onPressed: () {
                          context.push(RoutePaths.waiting);
                        },
                      ),
                      OrderStatusButton(
                        imageAsset:
                            'assets/images/Screenshot 2025-12-29 at 20.04.46.png',
                        text: 'Đang vận chuyển',
                        onPressed: () {
                          context.push(RoutePaths.transportOrder);
                        },
                      ),
                      OrderStatusButton(
                        imageAsset:
                            'assets/images/Screenshot 2025-12-29 at 20.06.19.png',
                        text: 'Hoàn thành',
                        onPressed: () {
                          context.push(RoutePaths.completeOrder);
                        },
                      ),
                      OrderStatusButton(
                        imageAsset:
                            'assets/images/Screenshot 2025-12-29 at 20.07.36.png',
                        text: 'Đơn hoàn',
                        onPressed: () {
                          context.push(RoutePaths.cancelOrderDetail);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Danh sách sản phẩm dạng grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Quản lý sản phẩm',
                    style: TextStyle(fontSize: 18, color: MyColor.textColor),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(121, 30, 12, 12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryButton(
                          onPressed: onNailPressed,
                          imageUrl: 'assets/icons/8.png',
                          text: 'Nail',
                        ),
                        CategoryButton(
                          onPressed: onThietBiNailPressed,
                          imageUrl: 'assets/icons/12.png',
                          text: 'Thiết bị nail',
                        ),
                        CategoryButton(
                          onPressed: onNailBoxPressed,
                          imageUrl: 'assets/icons/9.png',
                          text: 'Nail Box',
                        ),
                        CategoryButton(
                          onPressed: () {},
                          imageUrl:
                              'assets/icons/a56d3517bb1323832680fbe7eb342da0.jpg',
                          text: 'thêm sp mới',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Xu Hướng',
                    style: TextStyle(fontSize: 18, color: MyColor.textColor),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(121, 30, 12, 12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ButtonGradient(
                            onPressed: () {},
                            text: 'sp bán chạy',
                            borderRadius: 10,
                            gradient: MyColor.mainGradient2,
                            height: 44,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 18),
                        Expanded(
                          child: ButtonGradient(
                            onPressed: () {},
                            text: 'sp xu \nhướng ',
                            borderRadius: 10,
                            gradient: MyColor.mainGradient2,
                            height: 44,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 18),
                        Expanded(
                          child: ButtonGradient(
                            onPressed: () {},
                            text: 'sp mới',
                            borderRadius: 10,
                            gradient: MyColor.mainGradient2,
                            height: 44,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Quản lý Voucher',
                    style: TextStyle(fontSize: 18, color: MyColor.textColor),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(121, 30, 12, 12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ButtonGradient(
                            onPressed: () {},
                            text: 'xem voucher',
                            borderRadius: 10,
                            gradient: MyColor.mainGradient3,
                          ),
                        ),
                        SizedBox(width: 18),
                        Expanded(
                          child: ButtonGradient(
                            onPressed: () {},
                            text: 'tạo voucher',
                            borderRadius: 10,
                            gradient: MyColor.mainGradient3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
