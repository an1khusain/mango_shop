import 'package:hive/hive.dart';

import '../models/order_model.dart';

abstract class OrderLocalDataSource {
  List<OrderModel> getOrders();

  Future<void> addOrder(OrderModel order);

  Future<void> updateOrder(
      int index,
      OrderModel order,
      );

  Future<void> deleteOrder(int index);
}

class OrderLocalDataSourceImpl
    implements OrderLocalDataSource {
  final Box<OrderModel> box;

  OrderLocalDataSourceImpl(this.box);

  @override
  List<OrderModel> getOrders() {
    return box.values.toList();
  }

  @override
  Future<void> addOrder(
      OrderModel order,
      ) async {
    await box.add(order);
  }

  @override
  Future<void> updateOrder(
      int index,
      OrderModel order,
      ) async {
    await box.putAt(
      index,
      order,
    );
  }

  @override
  Future<void> deleteOrder(
      int index,
      ) async {
    await box.deleteAt(index);
  }
}