import '../entities/inventory.dart';
import '../repositories/inventory_repository.dart';

class UpdateStockUseCase {
  final InventoryRepository repository;

  UpdateStockUseCase(this.repository);

  Future<void> call(Inventory inventory) {
    return repository.updateStock(inventory);
  }
}