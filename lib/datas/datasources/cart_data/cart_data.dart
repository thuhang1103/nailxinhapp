import 'package:dio/dio.dart';

abstract class CartData {
  Future<int> createCart({required int customerId});

  Future<int> deleteCart({required int cartId});
}

class CartDataImpl implements CartData {
  final Dio dio;

  CartDataImpl(this.dio);

  @override
  Future<int> createCart({required int customerId}) async {
    final res = await dio.post(
      '/carts/create',
      data: {'customerId': customerId},
    );
    final body = res.data;
    final newId = (body is Map && body['insertId'] != null)
        ? int.parse(body['insertId'].toString())
        : 0;
    return newId;
  }

  @override
  Future<int> deleteCart({required int cartId}) async {
    final res = await dio.delete('/carts/delete/$cartId');
    final body = res.data;
    final affectedRows = (body is Map && body['affectedRows'] != null)
        ? int.parse(body['affectedRows'].toString())
        : 0;
    return affectedRows;
  }
}
