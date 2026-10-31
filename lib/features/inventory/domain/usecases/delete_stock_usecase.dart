import '../repositories/inventory_repository.dart';

class DeleteStockUseCase {
  final InventoryRepository repository;

  DeleteStockUseCase(this.repository);

  Future<void> call(String id) {
    return repository.deleteStock(id);
  }
}