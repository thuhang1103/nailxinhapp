import '../repositories/import_reporitory.dart';

class ImportUseCase {
  final ImportRepository repository;

  ImportUseCase(this.repository);

  Future<int> createImport({
    required String note,
    required double totalAmount,
    DateTime? createdAt,
  }) {
    return repository.createImport(
      note: note,
      totalAmount: totalAmount,
      createdAt: createdAt,
    );
  }
}
