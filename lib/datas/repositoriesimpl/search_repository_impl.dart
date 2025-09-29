import 'package:nailxinh/datas/local/search_history_storage.dart';
import '../../domain/repositories/search_repository.dart';

class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final SearchHistoryStorage storage;

  SearchHistoryRepositoryImpl(this.storage);

  @override
  Future<List<String>> getHistory() => storage.getSearchHistory();

  @override
  Future<void> addKeyword(String keyword) => storage.addKeyword(keyword);

  @override
  Future<void> clearHistory() => storage.clearHistory();
}
