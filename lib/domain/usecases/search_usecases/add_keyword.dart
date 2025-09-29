import 'package:nailxinh/domain/repositories/search_repository.dart';

class AddKeyword {
  final SearchHistoryRepository repository;

  AddKeyword(this.repository);

  Future<void> execute(String keyword) async {
    // có thể thêm logic kiểm tra trước khi lưu
    await repository.addKeyword(keyword);
  }
}
