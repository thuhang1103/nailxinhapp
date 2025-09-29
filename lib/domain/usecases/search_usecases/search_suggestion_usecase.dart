import '../../repositories/product_repository/search_suggestion_repository.dart';

class SearchSuggestionUseCase {
  final SearchSuggestionRepository repository;

  SearchSuggestionUseCase(this.repository);

  Future<List<String>> execute(String name) {
    return repository.getSuggestionsByName(name);
  }

  Future<void> addSuggestion({String? refreshToken, required String keyWord}) {
    return repository.addSuggestion(
      refreshToken: refreshToken,
      keyWord: keyWord,
    );
  }
}
