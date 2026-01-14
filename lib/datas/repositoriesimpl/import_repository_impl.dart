import '../datasources/import_data.dart';
import '../../domain/repositories/import_reporitory.dart';

class ImportRepositoryImpl implements ImportRepository {
  final ImportData data;

  ImportRepositoryImpl(this.data);

  @override
  Future<int> createImport({
    String note = '',
    required double totalAmount,
    DateTime? createdAt,
  }) {
    return data.createImportInventory(
      note: note,
      totalAmount: totalAmount,
      createdAt: createdAt,
    );
  }
}
