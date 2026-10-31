import '../entities/inventory.dart';
import '../repositories/inventory_repository.dart';

class AddStockUseCase {
  final InventoryRepository repository;

  AddStockUseCase(this.repository);

  Future<void> call(Inventory inventory) {
    return repository.addStock(inventory);
  }
}