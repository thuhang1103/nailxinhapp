import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class SearchHistoryStorage {
  static const _key = 'search_history';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Lấy lịch sử tìm kiếm
  Future<List<String>> getSearchHistory() async {
    print("lấy lịch sử tìm kiếm");
    String? jsonString = await _storage.read(key: _key);
    if (jsonString == null) return [];
    final List<dynamic> data = json.decode(jsonString);
    print("lịch sử tìm kiếm: $data");
    return data.cast<String>();
  }

  // Thêm từ khóa mới
  Future<void> addKeyword(String keyword) async {
    print("Thêm từ khóa tìm kiếm: $keyword");
    List<String> history = await getSearchHistory();

    // Nếu đã có thì loại bỏ cũ
    history.remove(keyword);

    // Thêm vào đầu
    history.insert(0, keyword);

    // Giới hạn tối đa 20 từ
    if (history.length > 20) {
      history = history.sublist(0, 20);
    }

    await _storage.write(key: _key, value: json.encode(history));
    print("Lịch sử sau khi thêm: $history");
  }

  // Xóa tất cả
  Future<void> clearHistory() async {
    await _storage.delete(key: _key);
  }
}
