abstract class SearchHistoryRepository {
  Future<List<String>> getHistory();
  Future<void> addKeyword(String keyword);
  Future<void> clearHistory();
}
