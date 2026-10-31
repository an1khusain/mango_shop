import 'package:flutter/material.dart';

import '../../domain/entities/order_entity.dart';
import '../../domain/usecases/add_order_usecase.dart';
import '../../domain/usecases/delete_order_usecase.dart';
import '../../domain/usecases/get_order_usecase.dart';
import '../../domain/usecases/update_order_usecase.dart';

class OrderProvider extends ChangeNotifier {
  final AddOrderUseCase addOrderUseCase;
  final GetOrdersUseCase getOrdersUseCase;
  final UpdateOrderUseCase updateOrdersUseCase;
  final DeleteOrderUseCase deleteOrderUseCase;

  OrderProvider({
    required this.addOrderUseCase,
    required this.getOrdersUseCase,
    required this.updateOrdersUseCase,
    required this.deleteOrderUseCase,
  }) {
    loadOrders();
  }

  /// Main List
  List<OrderEntity> _orders = [];

  /// Filtered List
  List<OrderEntity> _filteredOrders = [];

  /// Loading State
  bool _isLoading = false;

  /// Error State
  String? _errorMessage;

  //=========================
  // GETTERS
  //=========================

  List<OrderEntity> get orders =>
      _filteredOrders;

  bool get isLoading =>
      _isLoading;

  String? get errorMessage =>
      _errorMessage;

  //=========================
  // LOAD ORDERS
  //=========================

  Future<void> loadOrders() async {
    try {
      _isLoading = true;
      notifyListeners();

      _orders =
          getOrdersUseCase();

      _filteredOrders =
          List.from(_orders);

      _errorMessage = null;
    } catch (e) {
      _errorMessage =
          e.toString();
    }

    _isLoading = false;

    notifyListeners();
  }

  //=========================
  // ADD ORDER
  //=========================

  Future<void> addOrder(
      OrderEntity order,
      ) async {
    try {
      await addOrderUseCase(
        order,
      );

      await loadOrders();
    } catch (e) {
      _errorMessage =
          e.toString();

      notifyListeners();
    }
  }

  //=========================
  // UPDATE ORDER
  //=========================

  Future<void> updateOrder(
      int index,
      OrderEntity order,
      ) async {
    try {
      await updateOrdersUseCase(
        index,
        order,
      );

      await loadOrders();
    } catch (e) {
      _errorMessage =
          e.toString();

      notifyListeners();
    }
  }

  //=========================
  // DELETE ORDER
  //=========================

  Future<void> deleteOrder(
      int index,
      ) async {
    try {
      await deleteOrderUseCase(
        index,
      );

      await loadOrders();
    } catch (e) {
      _errorMessage =
          e.toString();

      notifyListeners();
    }
  }

  //=========================
  // SEARCH
  //=========================

  void searchOrders(
      String query,
      ) {
    if (query.isEmpty) {
      _filteredOrders =
          List.from(_orders);
    } else {
      _filteredOrders = _orders
          .where(
            (order) =>
        order.customerName
            .toLowerCase()
            .contains(
          query.toLowerCase(),
        ) ||
            order.phone.contains(
              query,
            ) ||
            order.mangoType
                .toLowerCase()
                .contains(
              query.toLowerCase(),
            ),
      )
          .toList();
    }

    notifyListeners();
  }

  //=========================
  // FILTER STATUS
  //=========================

  void filterByStatus(
      String status,
      ) {
    if (status == 'All') {
      _filteredOrders =
          List.from(_orders);
    } else {
      _filteredOrders = _orders
          .where(
            (order) =>
        order.status ==
            status,
      )
          .toList();
    }

    notifyListeners();
  }

  //=========================
  // FILTER PAYMENT
  //=========================

  void filterByPaymentStatus(
      String paymentStatus,
      ) {
    if (paymentStatus == 'All') {
      _filteredOrders =
          List.from(_orders);
    } else {
      _filteredOrders = _orders
          .where(
            (order) =>
        order.paymentStatus ==
            paymentStatus,
      )
          .toList();
    }

    notifyListeners();
  }

  //=========================
  // RESET FILTER
  //=========================

  void resetFilters() {
    _filteredOrders =
        List.from(_orders);

    notifyListeners();
  }

  //=========================
  // DASHBOARD HELPERS
  //=========================

  int get totalOrders =>
      _orders.length;

  int get pendingOrders =>
      _orders
          .where(
            (e) =>
        e.status ==
            'Pending',
      )
          .length;

  int get confirmedOrders =>
      _orders
          .where(
            (e) =>
        e.status ==
            'Confirmed',
      )
          .length;

  int get deliveredOrders =>
      _orders
          .where(
            (e) =>
        e.status ==
            'Delivered',
      )
          .length;

  int get cancelledOrders =>
      _orders
          .where(
            (e) =>
        e.status ==
            'Cancelled',
      )
          .length;

  //=========================
  // TOTAL REVENUE
  //=========================

  double get totalRevenue {
    return _orders.fold(
      0,
          (sum, order) =>
      sum +
          order.totalPrice,
    );
  }

  //=========================
  // RECENT ORDERS
  //=========================

  List<OrderEntity>
  get recentOrders {
    return _orders
        .reversed
        .take(3)
        .toList();
  }

  //=========================
  // PAID ORDERS
  //=========================

  int get paidOrders {
    return _orders
        .where(
          (e) =>
      e.paymentStatus ==
          'Paid',
    )
        .length;
  }

  //=========================
  // DUE ORDERS
  //=========================

  int get dueOrders {
    return _orders
        .where(
          (e) =>
      e.paymentStatus !=
          'Paid',
    )
        .length;
  }

  //=========================
  // CLEAR ERROR
  //=========================

  void clearError() {
    _errorMessage = null;

    notifyListeners();
  }
}