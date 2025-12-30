import 'package:flutter/material.dart';
import 'package:nailxinh/routers/router_path.dart';
import '../../widgets/searchBox/searchBox.dart';
import '../../../core/color/mycolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/storage_search_history/storage_search_history_bloc.dart';
import '../../../blocs/bloc/storage_search_history/suggestion_history_bloc.dart';
import '../../../blocs/evens/storage_search_history/storage_search_history_event.dart';
import '../../../blocs/evens/storage_search_history/suggestion_history_event.dart';
import '../../../blocs/states/storage_search_history/storage_search_history_state.dart';
import '../../../blocs/states/storage_search_history/suggestion_history_state.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/page_view/page_empty.dart';
import '../../widgets/button/button_gradient.dart';

class SearchPage extends StatefulWidget {
  final String? searchController;
  const SearchPage({Key? key, this.searchController}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _searchController.text = widget.searchController ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
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
    context.push(RoutePaths.searchResult, extra: keyword);
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.pinkColor,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(color: MyColor.pinkColor),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: MyColor.textColor,
                ),
                onPressed: () => context.pop(),
                iconSize: 19,
              ),
            ),
            Expanded(
              child: CustomSearchBox(
                controller: _searchController,
                focusNode: _focusNode,
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
                          return EmptyView(
                            message: 'không có lịch sử tìm kiếm',
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.history.length,
                                itemBuilder: (context, index) {
                                  final keyword = state.history[index];
                                  return Align(
                                    alignment: Alignment.centerLeft,
                                    child: IntrinsicWidth(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 32,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.pink[100],
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8,
                                                    ),
                                              ),
                                              onPressed: () {
                                                _searchController
                                                    .removeListener(
                                                      _onSearchChanged,
                                                    );
                                                _searchController.text =
                                                    keyword;
                                                _searchController.addListener(
                                                  _onSearchChanged,
                                                );
                                                _onKeywordSelected(keyword);
                                              },
                                              child: Text(
                                                keyword,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromARGB(
                                                    255,
                                                    90,
                                                    89,
                                                    91,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ), // khoảng cách giữa các item
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ButtonGradient(
                                text: 'Xoá lịch sử tìm kiếm',
                                onPressed: () {
                                  context.read<StorageSearchHistoryBloc>().add(
                                    ClearSearchHistoryEvent(),
                                  );
                                  _searchController.text = '';
                                },
                                height: 35,
                                gradient: MyColor.mainGradient2,
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
                          height: 42,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              ListTile(
                                dense: true, // giảm chiều cao mặc định
                                visualDensity: VisualDensity.compact,
                                title: Text(
                                  keyword,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                onTap: () {
                                  _searchController.removeListener(
                                    _onSearchChanged,
                                  );
                                  _searchController.text = keyword;
                                  _searchController.addListener(
                                    _onSearchChanged,
                                  );
                                  _onKeywordSelected(keyword);
                                },
                              ),
                              const Divider(
                                height: 1,
                                color: Color.fromARGB(255, 255, 255, 255),
                                thickness: 1,
                              ),
                            ],
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
