import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import '../../widgets/categorybutton.dart';
import '../../widgets/product_item.dart';
import '../../widgets/searchBox/searchButton.dart';
import '../search_pages/search_page.dart';
import '../productPages/nail_page.dart';
import '../productPages/nailbox_page.dart';
import '../productPages/device_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/storage_search_history/storage_search_history_bloc.dart';
import '../../../blocs/bloc/storage_search_history/suggestion_history_bloc.dart';
import '../../../blocs/bloc/product_bloc/search_product_category_bloc.dart';
import '../../../domain/usecases/search_usecases/search_suggestion_usecase.dart';
import '../../../domain/usecases/search_usecases/add_keyword.dart';
import '../../../domain/usecases/search_usecases/clear_history_search.dart';
import '../../../domain/usecases/search_usecases/getHistoryUsecase.dart';
import '../../../domain/usecases/product_usecase/search_product_usecase.dart';
import '../../../blocs/bloc/product_bloc/search_all.dart';
import '../../../blocs/evens/product_event/search_product_event.dart';
import '../../../blocs/states/product_state/search_all_state.dart';
//router
import 'package:go_router/go_router.dart';
import '../../../routers/router.dart';
import '../../../routers/router_name.dart';
import '../../../routers/router_path.dart';
//bloc
import '../../../features/fetch_Voucher/fetch_voucher_bloc.dart';
import '../../../features/fetch_Voucher/fetch_voucher_event.dart';
import '../../../features/fetch_Voucher/fetch_voucher_state.dart';
//voucher
import '../../../domain/entities/vouchers.dart';

import '../../widgets/voucher/voucher_container.dart';

class Shopping extends StatefulWidget {
  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  void onTichDiemPressed() {
    context.push(RoutePaths.getPointDaily);
  }

  void onMauNailPressed() {
    context.push(RoutePaths.nailSample);
  }

  void onNailPressed() {
    context.push(RoutePaths.nail);
  }

  void onThietBiNailPressed() {
    context.push(RoutePaths.device);
  }

  void onNailBoxPressed() {
    context.push(RoutePaths.nailBox);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VoucherBloc>().add(GetMaxVoucherEvent());
      context.read<SearchProductAllBloc>().add(GetAllProductsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 229, 229),
      appBar: AppBar(
        backgroundColor: MyColor.colorappbar,
        titleSpacing: 0, // bỏ padding mặc định
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 0,
            top: 10,
            bottom: 10,
          ),
          child: SearchButton(
            onTap: () {
              context.push(RoutePaths.search);
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Color(0xff630243)),
            onPressed: () {
              context.push(RoutePaths.cart);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icons/5.png',
                  ), // Đường dẫn ảnh đại diện
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Container(
                  height: 165,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MyColor.pinkColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                  ),
                ),

                Container(
                  // margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Column(
                    children: [
                      //vourcher
                      BlocSelector<VoucherBloc, VoucherState, Voucher?>(
                        selector: (state) => state.maxVoucher,
                        builder: (context, maxVoucher) {
                          if (maxVoucher == null) {
                            return const SizedBox();
                          }

                          return VoucherContainer(
                            Discount: '${maxVoucher.discount}',
                            minValue: '${maxVoucher.minOrderValue}',
                            startTime: maxVoucher.startTime ?? DateTime.now(),
                            endTime:
                                maxVoucher.endTime ??
                                DateTime.now().add(const Duration(days: 7)),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CategoryButton(
                              onPressed: onTichDiemPressed,
                              imageUrl: 'assets/icons/Abstract Shape (7).png',
                              text: 'Tích điểm',
                            ),
                            CategoryButton(
                              onPressed: onMauNailPressed,
                              imageUrl: 'assets/icons/11.png',
                              text: 'Mẫu nail',
                            ),
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
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 3,
                        width: 40,
                        child: Container(color: MyColor.textColor),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Danh sách sản phẩm dạng grid
          BlocBuilder<SearchProductAllBloc, SearchProductAllState>(
            builder: (context, state) {
              if (state is SearchProductAllLoading) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is SearchProductAllSuccess) {
                final listProduct = state.products;
                if (listProduct.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('Không có dữ liệu sản phẩm')),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 9,
                          mainAxisSpacing: 9,
                          childAspectRatio: 0.62,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = listProduct[index];
                      return ProductItem(
                        onTap: () {
                          context.push(
                            RoutePaths.productDetail,
                            extra: product.productId,
                          );
                        },
                        imagePath: product.imagePath ?? '',
                        name: product.productName,
                        price: product.basePrice,
                        soldCount: product.soldQuantity,
                      );
                    }, childCount: listProduct.length),
                  ),
                );
              }

              if (state is SearchProductAllFailure) {
                return SliverToBoxAdapter(
                  child: Center(child: Text("Lỗi: ${state.error}")),
                );
              }

              return const SliverToBoxAdapter(
                child: Text("Không có dữ liệu sản phẩm"),
              );
            },
          ),
        ],
      ),
    );
  }
}
