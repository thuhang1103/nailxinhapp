abstract class GetOrderEvent {
  const GetOrderEvent();
}
// ...existing code...

class GetOrder extends GetOrderEvent {
  final String status;

  const GetOrder({required this.status});
}
