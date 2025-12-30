import '../entities/order/order.dart';
import '../entities/order/order_detail.dart';
import '../repositories/order_repository.dart';

class OrderUseCase {
  final OrderRepository repository;

  OrderUseCase(this.repository);

  Future<int> createOrder({
    required int addressId,
    required String addressName,
    int? voucherId,
    required double totalAmount,
    double discountAmount = 0,
  }) {
    return repository.createOrder(
      addressId: addressId,
      addressName: addressName,
      voucherId: voucherId,
      totalAmount: totalAmount,
      discountAmount: discountAmount,
    );
  }

  Future<List<Order>> getMyOrders({String status = ''}) {
    return repository.getMyOrders(status: status);
  }

  Future<List<Order>> getOrdersByStatus({required String status}) {
    return repository.getOrdersByStatus(status: status);
  }

  Future<void> updateOrderStatus({
    required int orderId,
    required String status,
  }) {
    return repository.updateOrderStatus(orderId: orderId, status: status);
  }

  Future<int> createOrderDetail({
    required int orderId,
    required int productId,
    required String productName,
    required String variantName,
    required String imagePath,
    required int quantity,
    required double price,
  }) {
    return repository.createOrderDetail(
      orderId: orderId,
      productId: productId,
      productName: productName,
      variantName: variantName,
      imagePath: imagePath,
      quantity: quantity,
      price: price,
    );
  }

  Future<List<OrderDetail>> getOrderDetails(int orderId) {
    return repository.getOrderDetails(orderId);
  }
}
