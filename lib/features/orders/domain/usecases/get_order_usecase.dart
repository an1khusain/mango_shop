import 'package:mango_shop/features/orders/data/models/order_model.dart';
import 'package:mango_shop/features/orders/domain/entities/order_entity.dart';
import '../repositories/order_repository.dart';

class GetOrdersUseCase {
  final OrderRepository repository;

  GetOrdersUseCase(this.repository);

  List<OrderEntity> call() {
    return repository.getOrders();
  }
}