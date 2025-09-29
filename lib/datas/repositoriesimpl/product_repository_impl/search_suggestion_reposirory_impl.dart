import '../../../datas/datasources/product_data/search_suggestion_data.dart';
import '../../../domain/repositories/product_repository/search_suggestion_repository.dart';

class SearchSuggestionRepositoryImpl implements SearchSuggestionRepository {
  final SearchSuggestionData dataSource;

  SearchSuggestionRepositoryImpl(this.dataSource);

  @override
  Future<List<String>> getSuggestionsByName(String name) {
    return dataSource.getSuggestionsByName(name);
  }

  @override
  Future<void> addSuggestion({String? refreshToken, required String keyWord}) {
    return dataSource.addSuggestion(
      refreshToken: refreshToken,
      keyWord: keyWord,
    );
  }
}
