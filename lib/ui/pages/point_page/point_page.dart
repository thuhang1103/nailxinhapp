import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nailxinh/core/common_state.dart';
import '../../../features/get_point_daily/getPoint_bloc.dart';
import '../../../features/get_point_daily/getPoint_state.dart';
//event
import '../../../features/get_point_daily/getPoint_event.dart';
import '../../widgets/page_view/page_loading.dart';
import '../../../core/color/mycolor.dart';
//product
import '../../../domain/entities/products.dart';
//widget
import '../../../ui/widgets/product_item.dart';
//bloc
import '../../../features/get_point_daily/getPoint_bloc.dart';
import '../../../features/get_point_daily/getPoint_event.dart';
import '../../../features/get_point_daily/getPoint_state.dart';
import 'dart:async';

import '../../../blocs/evens/product_event/search_product_event.dart';
import '../../../blocs/bloc/product_bloc/search_all.dart';
import '../../../blocs/states/product_state/search_all_state.dart';
//router
import '../../../routers/router.dart';
import '../../../routers/router_name.dart';
import '../../../routers/router_path.dart';

class PointPage extends StatefulWidget {
  const PointPage({super.key});

  @override
  State<PointPage> createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  late StreamSubscription<String> _uiSub;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetPointBloc>().add(LoadPointData());
      context.read<SearchProductAllBloc>().add(GetAllProductsEvent());
    });

    _uiSub = context.read<GetPointBloc>().uiEvents.listen((msg) {
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
        title: Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Tích Điểm',
            style: TextStyle(color: MyColor.textColor, fontSize: 20),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // Đổi icon
          onPressed: () {
            context.pop();
          },
        ),
        backgroundColor: Colors.transparent, // Nền trong suốt
        elevation: 0, // Không bóng đổ
        iconTheme: const IconThemeData(
          color: MyColor.textColor,
        ), // Màu icon (nếu có)
      ),
      body: BlocListener<GetPointBloc, GetPointState>(
        listenWhen: (prev, curr) =>
            prev.lastSpinResult != curr.lastSpinResult &&
            curr.lastSpinResult != null,
        listener: (context, state) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        '🎉 Chúc mừng',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Bạn nhận được ${state.lastSpinResult} điểm',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          context.pop();
                          context.read<GetPointBloc>().add(ClearSpinResult());
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: BlocBuilder<GetPointBloc, GetPointState>(
          builder: (context, state) {
            return state.pointState.maybeWhen(
              loading: () => const LoadingView(),
              orElse: () => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPointSummary(state),
                    const SizedBox(height: 6),
                    _buildDailyPoint(context, state),
                    const SizedBox(height: 6),
                    _buildLuckyWheel(context, state),
                    const SizedBox(height: 6),
                    Divider(
                      color: Colors.white.withOpacity(0.9), // màu trắng nhẹ
                      thickness: 0.8, // độ dày mảnh
                      height: 8, // khoảng cách theo chiều dọc
                    ),
                    Center(
                      child: const SizedBox(
                        height: 20,
                        child: Text(
                          'sản phẩm yêu thích',
                          style: TextStyle(
                            color: Color.fromARGB(255, 77, 74, 74),
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.9), // màu trắng nhẹ
                      thickness: 0.8, // độ dày mảnh
                      height: 8, // khoảng cách theo chiều dọc
                    ),
                    const SizedBox(height: 8),
                    // GridView nhỏ bên trong Column — dùng shrinkWrap và disable scrolling
                    BlocBuilder<SearchProductAllBloc, SearchProductAllState>(
                      builder: (context, state) {
                        if (state is SearchProductAllLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is SearchProductAllSuccess) {
                          List<Product> products = List.from(state.products);

                          return GridView.builder(
                            padding: const EdgeInsets.all(8),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 sản phẩm mỗi hàng
                                  childAspectRatio: 0.62,
                                  crossAxisSpacing: 9,
                                  mainAxisSpacing: 9,
                                ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return ProductItem(
                                onTap: () {
                                  context.pushNamed(
                                    RouteNames.productDetail,
                                    extra: product,
                                  );
                                },
                                imagePath: product.imagePath ?? '',
                                name: product.productName,
                                price: product.basePrice,
                                soldCount: product.soldQuantity,
                              );
                            },
                          );
                        }
                        if (state is SearchProductAllFailure) {
                          return Center(child: Text('Lỗi: ${state.error}'));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPointSummary(GetPointState state) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 9, 8, 8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Điểm của bạn',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 246, 224, 20),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: Color.fromARGB(255, 246, 224, 20),
                size: 48,
              ),
              const SizedBox(height: 8),
              Text(
                '${state.point}',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 246, 224, 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDailyPoint(BuildContext context, GetPointState state) {
    final canClaim = state.canClaimToday == 1;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 9, 8, 8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 22),
            height: 28,

            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 248, 238, 179),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min, // Row chỉ rộng bằng nội dung
                mainAxisAlignment: MainAxisAlignment.center, // căn giữa ngang
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.card_giftcard,
                    color: Color.fromARGB(255, 12, 12, 12),
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text('Nhận điểm mỗi ngày', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Text(
              '100',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 246, 224, 20),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: ElevatedButton(
              onPressed: canClaim
                  ? () => context.read<GetPointBloc>().add(ReceiveDailyPoints())
                  : null,
              style: ElevatedButton.styleFrom(
                // màu khi active / màu khi disabled
                backgroundColor: Colors.white,
                foregroundColor: Color.fromARGB(255, 246, 224, 20),
                disabledBackgroundColor: const Color.fromARGB(
                  255,
                  176,
                  174,
                  174,
                ),
                disabledForegroundColor: const Color.fromARGB(
                  255,
                  255,
                  255,
                  255,
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(canClaim ? 'Nhận' : 'Đã nhận'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLuckyWheel(BuildContext context, GetPointState state) {
    final canSpin = state.canSpin;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 252, 241, 192),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.casino, color: Colors.purple, size: 36),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'lấy số may mắn',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'mỗi ngày bạn có một cơ hội lấy số may mắn đó',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: canSpin
                ? () {
                    context.read<GetPointBloc>().add(SpinLuckyWheel());
                  }
                : null,
            style: ElevatedButton.styleFrom(
              // màu khi active / màu khi disabled
              backgroundColor: Colors.white,
              foregroundColor: Color.fromARGB(255, 80, 12, 168),
              disabledBackgroundColor: const Color.fromARGB(255, 176, 174, 174),
              disabledForegroundColor: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.symmetric(vertical: 8),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: Text(canSpin ? 'nhận' : 'Đã nhận'),
          ),
        ],
      ),
    );
  }
}
