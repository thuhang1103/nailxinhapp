import 'package:nailxinh/domain/repositories/search_repository.dart';

class ClearHistorySearch {
  final SearchHistoryRepository repository;

  ClearHistorySearch(this.repository);

  Future<void> execute() async {
    // có thể thêm logic kiểm tra trước khi lưu
    await repository.clearHistory();
  }
}
