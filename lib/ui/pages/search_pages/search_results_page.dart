import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/product_bloc/search_product_name_bloc.dart';
import '../../../blocs/evens/product_event/search_product_event.dart';
import '../../../ui/widgets/searchBox/searchButton.dart';
import '../../../core/color/mycolor.dart';

import '../../../blocs/bloc/storage_search_history/storage_search_history_bloc.dart';
import '../../../blocs/bloc/storage_search_history/suggestion_history_bloc.dart';
import '../../../domain/usecases/search_usecases/add_keyword.dart';
import '../../../domain/usecases/search_usecases/clear_history_search.dart';
import '../../../domain/usecases/search_usecases/getHistoryUsecase.dart';
import '../../../domain/usecases/search_usecases/search_suggestion_usecase.dart';
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
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.selectedKeyword;
    context.read<SearchProductNameBloc>().add(
      SearchProductByNameEvent(widget.selectedKeyword),
    );
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
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
                        child: SearchPage(searchController: _searchController),
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Liên quan'),
            Tab(text: 'Mới nhất'),
            Tab(text: 'Bán chạy'),
            Tab(text: 'Giá'),
          ],
          labelColor: MyColor.textColor,
          indicatorColor: Colors.pink,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab "Liên quan" - hiển thị tất cả sản phẩm liên quan
          Center(child: Text('Sản phẩm liên quan: ${widget.selectedKeyword}')),
          // Tab "Mới nhất" - hiển thị sản phẩm mới nhất (thay bằng widget thực tế)
          Center(child: Text('Sản phẩm mới nhất')),
          // Tab "Bán chạy" - hiển thị sản phẩm bán chạy (thay bằng widget thực tế)
          Center(child: Text('Sản phẩm bán chạy')),
          // Tab "Giá" - hiển thị sản phẩm theo giá (thay bằng widget thực tế)
          Center(child: Text('Sản phẩm theo giá')),
        ],
      ),
    );
  }
}
