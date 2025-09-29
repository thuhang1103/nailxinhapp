import 'package:nailxinh/domain/repositories/search_repository.dart';

class GetSearchHistory {
  final SearchHistoryRepository repository;

  GetSearchHistory(this.repository);

  Future<List<String>> execute() async {
    return repository.getHistory();
  }
}
