import 'package:dio/dio.dart';

abstract class SearchSuggestionData {
  Future<List<String>> getSuggestionsByName(String name);
  Future<void> addSuggestion({String? refreshToken, required String keyWord});
}

class SearchSuggestionDataImpl implements SearchSuggestionData {
  final Dio dio;

  SearchSuggestionDataImpl(this.dio);

  Future<List<String>> getSuggestionsByName(String name) async {
    try {
      print("vào data source lấy gợi ý tìm kiếm: $name");
      final response = await dio.get(
        '/suggestions/name',
        queryParameters: {'name': name},
      );
      final List data = response.data as List;
      return data.map((item) => item['keyWord'] as String).toList();
    } catch (e) {
      throw Exception('Lỗi khi lấy gợi ý sản phẩm: $e');
    }
  }

  Future<void> addSuggestion({
    String? refreshToken,
    required String keyWord,
  }) async {
    try {
      final data = {'keyWord': keyWord};
      if (refreshToken != null) {
        data['refreshToken'] = refreshToken;
      }
      await dio.post('/suggestions/add', data: data);
    } catch (e) {
      throw Exception('Lỗi khi thêm từ khóa gợi ý: $e');
    }
  }
}
