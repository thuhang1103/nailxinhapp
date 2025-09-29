import 'package:flutter/material.dart';
import '../../widgets/searchBox/searchBox.dart';
import '../../../core/color/mycolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/storage_search_history/storage_search_history_bloc.dart';
import '../../../blocs/bloc/storage_search_history/suggestion_history_bloc.dart';
import '../../../blocs/evens/storage_search_history/storage_search_history_event.dart';
import '../../../blocs/evens/storage_search_history/suggestion_history_event.dart';
import '../../../blocs/states/storage_search_history/storage_search_history_state.dart';
import '../../../blocs/states/storage_search_history/suggestion_history_state.dart';
import 'search_results_page.dart';
import '../../../domain/usecases/product_usecase/search_product_usecase.dart';
import '../../../blocs/bloc/product_bloc/search_product_name_bloc.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController? searchController;
  const SearchPage({Key? key, this.searchController}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _searchController;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController = widget.searchController ?? TextEditingController();
    context.read<StorageSearchHistoryBloc>().add(LoadSearchHistoryEvent());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      print('Query is empty');
      context.read<StorageSearchHistoryBloc>().add(LoadSearchHistoryEvent());
    } else {
      print('Query: $query'); // Thêm log để kiểm tra
      context.read<SuggestionHistoryBloc>().add(GetSuggestionListEvent(query));
    }
  }

  void _onKeywordSelected(String keyword) {
    // Thêm vào lịch sử
    context.read<StorageSearchHistoryBloc>().add(
      AddSearchKeywordEvent(keyword),
    );
    context.read<SuggestionHistoryBloc>().add(
      AddSuggestionEvent(keyWord: keyword),
    );

    _searchController.text = keyword;

    // TODO: chuyển sang trang kết quả tìm kiếm
    print("Searching for: $keyword");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              SearchProductNameBloc(context.read<SearchProductUseCase>()),
          child: SearchResultsPage(selectedKeyword: keyword),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim();
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
              child: CustomSearchBox(
                controller: _searchController,
                focusNode: _focusNode,
                onChanged: (_) => _onSearchChanged(),
                onSearch: () =>
                    _onKeywordSelected(_searchController.text.trim()),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: query.isEmpty
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  BlocBuilder<
                    StorageSearchHistoryBloc,
                    StorageSearchHistoryState
                  >(
                    builder: (context, state) {
                      if (state is StorageSearchHistoryLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is StorageSearchHistoryLoaded) {
                        if (state.history.isEmpty) {
                          return Center(
                            child: const Text('Không có lịch sử tìm kiếm'),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.history.length,
                                itemBuilder: (context, index) {
                                  final keyword = state.history[index];
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 32,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors.pink[100],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            padding: EdgeInsets.zero,
                                          ),
                                          onPressed: () =>
                                              _onKeywordSelected(keyword),
                                          child: Center(
                                            child: Text(
                                              keyword,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ), // khoảng cách giữa các item
                                    ],
                                  );
                                },
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<StorageSearchHistoryBloc>().add(
                                    ClearSearchHistoryEvent(),
                                  );
                                  _searchController.text = '';
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.pink[100], // màu nền
                                  foregroundColor: const Color.fromARGB(
                                    255,
                                    49,
                                    48,
                                    50,
                                  ), // màu chữ
                                ),
                                child: Center(
                                  child: const Text('Xoá lịch sử tìm kiếm'),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  Container(
                    height: 600,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 254, 254),
                    ),
                  ),
                ],
              ),
            )
          : BlocBuilder<SuggestionHistoryBloc, SuggestionHistoryState>(
              builder: (context, state) {
                print("bắt đầu build gợi ý tìm kiếm");
                if (state is SuggestionHistoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is SuggestionHistoryLoaded) {
                  if (state.suggestions.isEmpty) {
                    return Container(
                      decoration: BoxDecoration(
                        gradient: MyColor.colorbackground,
                      ),
                      child: const Center(child: Text('Không có gợi ý')),
                    );
                  }
                  print("trả về đúng state: ${state.suggestions}");
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: MyColor.colorbackground,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.suggestions.length,
                      itemBuilder: (context, index) {
                        final keyword = state.suggestions[index];
                        return Container(
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: const Color.fromARGB(255, 122, 121, 121),
                                width: 2,
                              ), // viền dưới
                              // top: BorderSide(...), left: BorderSide(...), right: BorderSide(...) nếu muốn viền cạnh khác
                            ),
                          ),
                          child: ListTile(
                            title: Text(keyword),
                            onTap: () => _onKeywordSelected(keyword),
                          ),
                        );
                      },
                      reverse: true,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
    );
  }
}
