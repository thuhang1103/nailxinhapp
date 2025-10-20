import 'package:dio/dio.dart';

abstract class CartRepository {
  /// Tạo cart mới cho customer, trả về cartId (>=1) hoặc 0 nếu thất bại
  Future<int> createCart({required int customerId});

  /// Xóa cart theo id, trả về số hàng bị ảnh hưởng (thường 1 nếu thành công, 0 nếu không)
  Future<int> deleteCart({required int cartId});
}
