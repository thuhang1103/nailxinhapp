import 'package:flutter/material.dart';
import '../../widgets/searchBox/searchButton.dart';
import '../../widgets/voucher/voucher_container.dart';
import '../../../core/color/mycolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/product_bloc/search_product_category_bloc.dart';
import '../../../blocs/evens/product_event/search_product_event.dart';
import '../../../blocs/states/product_state/search_product_category_state.dart';
import '../../../domain/entities/products.dart';
import '../../../ui/widgets/product_item.dart';
//router
import 'package:go_router/go_router.dart';
import '../../../routers/router.dart';
import '../../../routers/router_name.dart';
import '../../../routers/router_path.dart';

class DevicePage extends StatefulWidget {
  final int category;
  const DevicePage({Key? key, required this.category}) : super(key: key);

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage>
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
      SearchProductByCategoryEvent(widget.category),
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
                  context.push(RoutePaths.search);
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
          VoucherContainer(
            Discount: '50.000',
            minValue: '200.000',
            startTime: DateTime.now(),
            endTime: DateTime.now().add(const Duration(days: 7)),
          ),
          const SizedBox(height: 10),
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              gradient: MyColor.mainGradient,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Tất cả'),
                Tab(text: 'Mới nhất'),
                Tab(text: 'Bán chạy'),
                Tab(text: 'Giá'),
              ],
              labelColor: Colors.white, // màu chữ tab đang chọn
              unselectedLabelColor: Colors.white, // màu chữ tab chưa chọn
              indicatorColor: Colors.white, // màu gạch dưới tab đang chọn
              indicatorWeight: 3,
              labelStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Container(
              height: 6,
              width: 100,
              color: MyColor.textColor,
              margin: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
          const SizedBox(height: 10),
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
                      List<Product> sortedProducts = List.from(state.products);

                      // Sắp xếp theo tab
                      switch (_tabController.index) {
                        case 1: // Mới nhất
                          sortedProducts.sort(
                            (a, b) => b.createdAt.compareTo(a.createdAt),
                          );
                          break;
                        case 2: // Bán chạy
                          sortedProducts.sort(
                            (a, b) => b.soldQuantity.compareTo(a.soldQuantity),
                          );
                          break;
                        case 3: // Giá
                          sortedProducts.sort(
                            (a, b) => a.basePrice.compareTo(b.basePrice),
                          );
                          break;
                        default:
                          break;
                      }

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
                        itemCount: sortedProducts.length,
                        itemBuilder: (context, index) {
                          final product = sortedProducts[index];
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
