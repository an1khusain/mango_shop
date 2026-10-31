import 'package:equatable/equatable.dart';

class Inventory extends Equatable {
  final String id;
  final String mangoName;
  final double quantity;
  final double purchasePrice;
  final double sellingPrice;
  final int lowStockThreshold;
  final DateTime createdAt;

  const Inventory({
    required this.id,
    required this.mangoName,
    required this.quantity,
    required this.purchasePrice,
    required this.sellingPrice,
    required this.lowStockThreshold,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    mangoName,
    quantity,
    purchasePrice,
    sellingPrice,
    lowStockThreshold,
    createdAt,
  ];
}