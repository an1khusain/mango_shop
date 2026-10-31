import '../entities/order_entity.dart';

abstract class OrderRepository {
  List<OrderEntity> getOrders();

  Future<void> addOrder(
      OrderEntity order,
      );

  Future<void> updateOrder(
      int index,
      OrderEntity order,
      );

  Future<void> deleteOrder(
      int index,
      );
}