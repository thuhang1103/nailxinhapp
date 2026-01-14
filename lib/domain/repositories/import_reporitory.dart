abstract class ImportRepository {
  Future<int> createImport({
    String note = '',
    required double totalAmount,
    DateTime? createdAt,
  });
}
