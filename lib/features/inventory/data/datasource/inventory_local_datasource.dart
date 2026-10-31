import 'package:hive/hive.dart';

import '../models/inventory_model.dart';

abstract class InventoryLocalDataSource {
  Future<void> addStock(InventoryModel inventory);

  Future<void> updateStock(InventoryModel inventory);

  Future<void> deleteStock(String id);

  Future<List<InventoryModel>> getAllStock();

  Future<InventoryModel?> getStock(String id);
}

class InventoryLocalDataSourceImpl implements InventoryLocalDataSource {
  final Box<InventoryModel> inventoryBox;

  InventoryLocalDataSourceImpl(this.inventoryBox);

  @override
  Future<void> addStock(InventoryModel inventory) async {
    await inventoryBox.put(inventory.id, inventory);
  }

  @override
  Future<void> updateStock(InventoryModel inventory) async {
    await inventoryBox.put(inventory.id, inventory);
  }

  @override
  Future<void> deleteStock(String id) async {
    await inventoryBox.delete(id);
  }

  @override
  Future<List<InventoryModel>> getAllStock() async {
    return inventoryBox.values.toList();
  }

  @override
  Future<InventoryModel?> getStock(String id) async {
    return inventoryBox.get(id);
  }
}