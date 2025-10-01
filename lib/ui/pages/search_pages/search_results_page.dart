import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/product_bloc/search_product_name_bloc.dart';
import '../../../blocs/evens/product_event/search_product_event.dart';
import '../../../ui/widgets/searchBox/searchButton.dart';
import '../../../core/color/mycolor.dart';
import '../../../domain/entities/products.dart';
import '../../../blocs/bloc/storage_search_history/storage_search_history_bloc.dart';
import '../../../blocs/bloc/storage_search_history/suggestion_history_bloc.dart';
import '../../../domain/usecases/search_usecases/add_keyword.dart';
import '../../../domain/usecases/search_usecases/clear_history_search.dart';
import '../../../domain/usecases/search_usecases/getHistoryUsecase.dart';
import '../../../domain/usecases/search_usecases/search_suggestion_usecase.dart';
import '../../../blocs/states/product_state/search_product_name_state.dart';
import '../../widgets/product_item.dart';
import 'search_page.dart';

class SearchResultsPage extends StatefulWidget {
  final String selectedKeyword;
  const SearchResultsPage({Key? key, required this.selectedKeyword})
    : super(key: key);

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    print("chuẩn bị vào bloc");
    context.read<SearchProductNameBloc>().add(
      SearchProductByNameEvent(widget.selectedKeyword),
    );
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      context.read<SearchProductNameBloc>().add(
        SearchProductByNameEvent(widget.selectedKeyword),
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Thực hiện logic tìm kiếm với selectedKeyword
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => StorageSearchHistoryBloc(
                              clear: context.read<ClearHistorySearch>(),
                              addKeywordUsecase: context.read<AddKeyword>(),
                              getHistoryUsecase: context
                                  .read<GetSearchHistory>(),
                            ),
                          ),
                          BlocProvider(
                            create: (context) => SuggestionHistoryBloc(
                              context.read<SearchSuggestionUseCase>(),
                            ),
                          ),
                        ],
                        child: SearchPage(
                          searchController: widget.selectedKeyword,
                        ),
                      ),
                    ),
                  );
                },

                hintText: widget.selectedKeyword,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.white, // Màu nền cho cả thanh TabBar
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Liên quan'),
                Tab(text: 'Mới nhất'),
                Tab(text: 'Bán chạy'),
                Tab(text: 'Giá'),
              ],
              labelColor: MyColor.textColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor:
                  MyColor.textColor, // Màu gạch ngang dưới tab đang chọn
              indicatorWeight: 3,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              unselectedLabelStyle: const TextStyle(fontSize: 13),
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchProductNameBloc, SearchProductNameState>(
        builder: (context, state) {
          if (state is SearchProductNameLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SearchProductNameSuccess) {
            // Lấy danh sách sản phẩm từ state

            List<Product> sortedProducts = List.from(state.products);

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
                sortedProducts.sort((a, b) => a.price.compareTo(b.price));
                break;
              default:
                // Không cần sort
                break;
            }

            // Hiển thị GridView sản phẩm
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 sản phẩm mỗi hàng
                childAspectRatio: 0.62,
                crossAxisSpacing: 9,
                mainAxisSpacing: 9,
              ),
              itemCount: sortedProducts.length,
              itemBuilder: (context, index) {
                final product = sortedProducts[index];
                return ProductItem(
                  imagePath: product.imagePath ?? '',
                  name: product.productName,
                  price: '${product.price}đ',
                  soldCount: product.soldQuantity,
                );
              },
            );
          }
          if (state is SearchProductNameFailure) {
            return Center(child: Text('Lỗi: ${state.error}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
