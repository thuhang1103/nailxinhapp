import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

//router
import 'package:go_router/go_router.dart';
import '../../../../routers/router_path.dart';
import '../../../../blocs/bloc/product_bloc/search_product_category_bloc.dart';
import '../../../../blocs/evens/product_event/search_product_event.dart';
import '../../../../blocs/states/product_state/search_product_category_state.dart';
import '../../../../core/color/mycolor.dart';
import '../../../../ui/widgets/searchBox/searchButton.dart';
import '../../../../domain/entities/products.dart';
import '../../../../ui/widgets/product_item_AD.dart';

class ProductDeviceADPage extends StatefulWidget {
  const ProductDeviceADPage({Key? key}) : super(key: key);

  @override
  State<ProductDeviceADPage> createState() => _ProductDeviceADPageState();
}

class _ProductDeviceADPageState extends State<ProductDeviceADPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  void _onKeywordSelected(String keyword) {
    // Xử lý tìm kiếm sản phẩm theo keyword
    // setState nếu cần cập nhật UI
  }

  @override
  void initState() {
    super.initState();
    context.read<SearchProductCategoryBloc>().add(
      SearchProductByCategoryEvent(1),
    );
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Expanded(
              child: SearchButton(
                onTap: () {
                  //context.push(RoutePaths.search);
                },
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.filter_list, color: MyColor.textColor),
              onPressed: () {
                // Xử lý lọc sản phẩm
              },
              iconSize: 24,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:
                BlocBuilder<
                  SearchProductCategoryBloc,
                  SearchProductCategoryState
                >(
                  builder: (context, state) {
                    if (state is SearchProductCategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is SearchProductCategorySuccess) {
                      List<Product> products = List.from(state.products);

                      // Hiển thị danh sách lớn bằng GridView.builder
                      return GridView.builder(
                        padding: const EdgeInsets.all(8),
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
                          return ProductItemAD(
                            onTap: () {
                              context.push(
                                RoutePaths.productDeviceAd,
                                extra: {'product': product},
                              );
                            },
                            imagePath: product.imagePath ?? '',
                            name: product.productName,
                            price: product.basePrice,
                            soldCount: product.soldQuantity,
                            stock: product.stockQuantity,
                          );
                        },
                      );
                    }
                    if (state is SearchProductCategoryFailure) {
                      return Center(child: Text('Lỗi: ${state.error}'));
                    }
                    return const SizedBox.shrink();
                  },
                ),
          ),
        ],
      ),
    );
  }
}
