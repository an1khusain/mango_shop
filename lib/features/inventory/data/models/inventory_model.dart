import 'package:hive/hive.dart';

import '../../domain/entities/inventory.dart';

part 'inventory_model.g.dart';

@HiveType(typeId: 1)
class InventoryModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String mangoName;

  @HiveField(2)
  final double quantity;

  @HiveField(3)
  final double purchasePrice;

  @HiveField(4)
  final double sellingPrice;

  @HiveField(5)
  final int lowStockThreshold;

  @HiveField(6)
  final DateTime createdAt;

  InventoryModel({
    required this.id,
    required this.mangoName,
    required this.quantity,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.lowStockThreshold,
    required this.createdAt,
  });

  factory InventoryModel.fromEntity(Inventory inventory) {
    return InventoryModel(
      id: inventory.id,
      mangoName: inventory.mangoName,
      quantity: inventory.quantity,
      purchasePrice: inventory.purchasePrice,
      sellingPrice: inventory.sellingPrice,
      lowStockThreshold: inventory.lowStockThreshold,
      createdAt: inventory.createdAt,
    );
  }

  Inventory toEntity() {
    return Inventory(
      id: id,
      mangoName: mangoName,
      quantity: quantity,
      purchasePrice: purchasePrice,
      sellingPrice: sellingPrice,
      lowStockThreshold: lowStockThreshold,
      createdAt: createdAt,
    );
  }
}