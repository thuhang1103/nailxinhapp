abstract class ManageOrderEvent {
  const ManageOrderEvent();
}
// ...existing code...

class GetOrderEvent extends ManageOrderEvent {
  final String status;

  const GetOrderEvent({required this.status});
}

class GetOrderDetailEvent extends ManageOrderEvent {
  final int orderId;

  const GetOrderDetailEvent({required this.orderId});
}

class UpdateOrderEvent extends ManageOrderEvent {
  final int orderId;
  final String status;

  const UpdateOrderEvent({required this.orderId, required this.status});
}

//selectorderid
class SelectOrderIdEvent extends ManageOrderEvent {
  final int orderId;

  const SelectOrderIdEvent({required this.orderId});
}

class ResetStateEvent extends ManageOrderEvent {
  const ResetStateEvent();
}
