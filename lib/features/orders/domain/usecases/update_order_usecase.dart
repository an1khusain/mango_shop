import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

class UpdateOrderUseCase {
  final OrderRepository repository;

  UpdateOrderUseCase(this.repository);

  Future<void> call(
      int index,
      OrderEntity order,
      ) async {
    await repository.updateOrder(
      index,
      order,
    );
  }
}