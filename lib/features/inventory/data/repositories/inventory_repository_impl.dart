import '../../domain/entities/inventory.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../datasource/inventory_local_datasource.dart';
import '../models/inventory_model.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryLocalDataSource localDataSource;

  InventoryRepositoryImpl({required this.localDataSource});

  @override
  Future<void> addStock(Inventory inventory) async {
    final inventoryModel = InventoryModel.fromEntity(inventory);
    await localDataSource.addStock(inventoryModel);
  }

  @override
  Future<void> updateStock(Inventory inventory) async {
    final inventoryModel = InventoryModel.fromEntity(inventory);
    await localDataSource.updateStock(inventoryModel);
  }

  @override
  Future<void> deleteStock(String id) async {
    await localDataSource.deleteStock(id);
  }

  @override
  Future<List<Inventory>> getAllStock() async {
    final inventoryModels = await localDataSource.getAllStock();

    return inventoryModels
        .map((inventoryModel) => inventoryModel.toEntity())
        .toList();
  }

  @override
  Future<Inventory?> getStock(String id) async {
    final inventoryModel = await localDataSource.getStock(id);

    if (inventoryModel == null) {
      return null;
    }

    return inventoryModel.toEntity();
  }
}
