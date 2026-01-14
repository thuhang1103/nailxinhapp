abstract class ManageImportEvent {
  const ManageImportEvent();
}
// ...existing code...

class CreateImportEvent extends ManageImportEvent {
  final String note;
  final double totalAmount;
  final DateTime? createdAt;

  const CreateImportEvent({
    required this.note,
    required this.totalAmount,
    this.createdAt,
  });
}
