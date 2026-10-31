import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';

import '../datasource/order_local_datasource.dart';
import '../models/order_model.dart';

class OrderRepositoryImpl
    implements OrderRepository {
  final OrderLocalDataSource
  localDataSource;

  OrderRepositoryImpl(
      this.localDataSource,
      );

  @override
  List<OrderEntity> getOrders() {
    return localDataSource
        .getOrders()
        .map(
          (model) =>
          model.toEntity(),
    )
        .toList();
  }

  @override
  Future<void> addOrder(
      OrderEntity order,
      ) async {
    await localDataSource.addOrder(
      OrderModel.fromEntity(
        order,
      ),
    );
  }

  @override
  Future<void> updateOrder(
      int index,
      OrderEntity order,
      ) async {
    await localDataSource.updateOrder(
      index,
      OrderModel.fromEntity(
        order,
      ),
    );
  }

  @override
  Future<void> deleteOrder(
      int index,
      ) async {
    await localDataSource.deleteOrder(
      index,
    );
  }
}