import '../entities/inventory.dart';
import '../repositories/inventory_repository.dart';

class GetAllStockUseCase {
  final InventoryRepository repository;

  GetAllStockUseCase(this.repository);

  Future<List<Inventory>> call() {
    return repository.getAllStock();
  }
}