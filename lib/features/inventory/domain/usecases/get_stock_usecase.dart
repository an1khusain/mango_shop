import '../entities/inventory.dart';
import '../repositories/inventory_repository.dart';

class GetStockUseCase {
  final InventoryRepository repository;

  GetStockUseCase(this.repository);

  Future<Inventory?> call(String id) {
    return repository.getStock(id);
  }
}