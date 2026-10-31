import '../entities/inventory.dart';

abstract class InventoryRepository {
  Future<void> addStock(Inventory inventory);

  Future<void> updateStock(Inventory inventory);

  Future<void> deleteStock(String id);

  Future<List<Inventory>> getAllStock();

  Future<Inventory?> getStock(String id);
}