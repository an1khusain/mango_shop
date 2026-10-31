import 'package:flutter/material.dart';

import '../../domain/entities/inventory.dart';
import '../../domain/usecases/add_stock_usecase.dart';
import '../../domain/usecases/delete_stock_usecase.dart';
import '../../domain/usecases/get_all_stock_usecase.dart';
import '../../domain/usecases/get_stock_usecase.dart';
import '../../domain/usecases/update_stock_usecase.dart';

class InventoryProvider extends ChangeNotifier {
  final AddStockUseCase addStockUseCase;
  final UpdateStockUseCase updateStockUseCase;
  final DeleteStockUseCase deleteStockUseCase;
  final GetAllStockUseCase getAllStockUseCase;
  final GetStockUseCase getStockUseCase;

  InventoryProvider({
    required this.addStockUseCase,
    required this.updateStockUseCase,
    required this.deleteStockUseCase,
    required this.getAllStockUseCase,
    required this.getStockUseCase,
  });

  List<Inventory> _inventoryList = [];
  List<Inventory> get inventoryList => _inventoryList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  /// Load all inventory
  Future<void> loadInventory() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      _inventoryList = await getAllStockUseCase();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Add inventory
  Future<void> addInventory(Inventory inventory) async {
    try {
      await addStockUseCase(inventory);
      await loadInventory();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  /// Update inventory
  Future<void> updateInventory(Inventory inventory) async {
    try {
      await updateStockUseCase(inventory);
      await loadInventory();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  /// Delete inventory
  Future<void> deleteInventory(String id) async {
    try {
      await deleteStockUseCase(id);
      await loadInventory();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  /// Get one inventory item
  Future<Inventory?> getInventory(String id) async {
    try {
      return await getStockUseCase(id);
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return null;
    }
  }

  /// Search inventory by mango name
  List<Inventory> searchInventory(String keyword) {
    if (keyword.trim().isEmpty) {
      return _inventoryList;
    }

    return _inventoryList.where((item) {
      return item.mangoName
          .toLowerCase()
          .contains(keyword.toLowerCase());
    }).toList();
  }

  /// Low stock items
  List<Inventory> get lowStockItems {
    return _inventoryList.where((item) {
      return item.quantity <= item.lowStockThreshold;
    }).toList();
  }

  /// Total inventory value (Selling Price)
  double get totalInventoryValue {
    return _inventoryList.fold(
      0,
          (sum, item) => sum + (item.quantity * item.sellingPrice),
    );
  }

  /// Total stock (Kg)
  double get totalStock {
    return _inventoryList.fold(
      0,
          (sum, item) => sum + item.quantity,
    );
  }
}