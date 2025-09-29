abstract class SearchSuggestionRepository {
  Future<List<String>> getSuggestionsByName(String name);
  Future<void> addSuggestion({String? refreshToken, required String keyWord});
}
