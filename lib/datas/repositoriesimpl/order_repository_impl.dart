import '../datasources/order_data.dart';
import '../../domain/repositories/order_repository.dart';
import '../../domain/entities/order/order.dart';
import '../../domain/entities/order/order_detail.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderData data;

  OrderRepositoryImpl(this.data);

  @override
  Future<int> createOrder({
    required int addressId,
    required String addressName,
    int? voucherId,
    required double totalAmount,
    double discountAmount = 0,
  }) {
    return data.createOrder(
      addressId: addressId,
      addressName: addressName,
      voucherId: voucherId,
      totalAmount: totalAmount,
      discountAmount: discountAmount,
    );
  }

  @override
  Future<List<Order>> getMyOrders({String status = ''}) {
    return data.getMyOrders(status: status);
  }

  @override
  Future<List<Order>> getOrdersByStatus({required String status}) {
    return data.getOrdersByStatus(status: status);
  }

  @override
  Future<void> updateOrderStatus({
    required int orderId,
    required String status,
  }) {
    return data.updateOrderStatus(orderId: orderId, status: status);
  }

  @override
  Future<int> createOrderDetail({
    required int orderId,
    required int productId,
    required String productName,
    required String variantName,
    required String imagePath,
    required int quantity,
    required double price,
  }) {
    return data.createOrderDetail(
      orderId: orderId,
      productId: productId,
      productName: productName,
      variantName: variantName,
      imagePath: imagePath,
      quantity: quantity,
      price: price,
    );
  }

  @override
  Future<List<OrderDetail>> getOrderDetails(int orderId) {
    return data.getOrderDetailsByOrderId(orderId);
  }
}
