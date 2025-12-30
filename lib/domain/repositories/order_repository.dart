import '../entities/order/order.dart';
import '../entities/order/order_detail.dart';

abstract class OrderRepository {
  Future<int> createOrder({
    required int addressId,
    required String addressName,
    int? voucherId,
    required double totalAmount,
    double discountAmount = 0,
  });

  Future<List<Order>> getMyOrders({String status = ''});
  Future<List<Order>> getOrdersByStatus({required String status});
  Future<void> updateOrderStatus({
    required int orderId,
    required String status,
  });

  Future<int> createOrderDetail({
    required int orderId,
    required int productId,
    required String productName,
    required String variantName,
    required String imagePath,
    required int quantity,
    required double price,
  });

  Future<List<OrderDetail>> getOrderDetails(int orderId);
}
