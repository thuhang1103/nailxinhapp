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

class Shopping extends StatefulWidget {
  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  void onTichDiemPressed() {
    // Xử lý sự kiện tích điểm
  }

  void onMauNailPressed() {
    // Xử lý sự kiện mẫu nail
  }
  void onNailPressed() {
    final categoryProduct = 2;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              SearchProductCategoryBloc(context.read<SearchProductUseCase>()),
          child: NailPage(category: categoryProduct),
        ),
      ),
    ); // Xử lý sự kiện nail
  }

  void onThietBiNailPressed() {
    final categoryProduct = 1;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              SearchProductCategoryBloc(context.read<SearchProductUseCase>()),
          child: DevicePage(category: categoryProduct),
        ),
      ),
    ); //
    // Xử lý sự kiện thiết bị nail
  }

  void onNailBoxPressed() {
    final categoryProduct = 3;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              SearchProductCategoryBloc(context.read<SearchProductUseCase>()),
          child: NailBoxPage(category: categoryProduct),
        ),
      ),
    ); //
  }

  @override
  void initState() {
    super.initState();
    context.read<SearchProductAllBloc>().add(GetAllProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 218, 218),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => StorageSearchHistoryBloc(
                          clear: context.read<ClearHistorySearch>(),
                          addKeywordUsecase: context.read<AddKeyword>(),
                          getHistoryUsecase: context.read<GetSearchHistory>(),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => SuggestionHistoryBloc(
                          context.read<SearchSuggestionUseCase>(),
                        ),
                      ),
                    ],
                    child: SearchPage(),
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Color(0xff630243)),
            onPressed: () {
              // Xử lý khi nhấn icon
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
                    'assets/images/image1.PNG',
                  ), // Đường dẫn ảnh đại diện
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
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
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  //vourcher
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: MyColor.mainGradient,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryButton(
                          onPressed: () {},
                          imageUrl: 'assets/icons/Abstract Shape (7).png',
                          text: 'Tích điểm',
                        ),
                        CategoryButton(
                          onPressed: () {},
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

                  // Danh sách sản phẩm
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: BlocBuilder<SearchProductAllBloc, SearchProductAllState>(
                      builder: (context, state) {
                        if (state is SearchProductAllLoading) {
                          return CircularProgressIndicator();
                        }
                        if (state is SearchProductAllSuccess) {
                          final listProduct = state.products;
                          if (listProduct.isEmpty) {
                            return const Center(
                              child: Text('Không có dữ liệu sản phẩm'),
                            );
                          }
                          return GridView.builder(
                            padding: const EdgeInsets.all(8),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 sản phẩm mỗi hàng
                                  childAspectRatio: 0.62,
                                  crossAxisSpacing: 9,
                                  mainAxisSpacing: 9,
                                ),
                            itemCount: listProduct.length,
                            itemBuilder: (context, index) {
                              final product = listProduct[index];
                              return ProductItem(
                                imagePath: product.imagePath ?? '',
                                name: product.productName,
                                price: '${product.price}đ',
                                soldCount: product.soldQuantity,
                              );
                            },
                          );
                        }
                        if (state is SearchProductAllFailure) {
                          return Center(child: Text('Lỗi: ${state.error}'));
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
