import '../repositories/order_repository.dart';

class DeleteOrderUseCase {
  final OrderRepository repository;

  DeleteOrderUseCase(this.repository);

  Future<void> call(int index) async {
    await repository.deleteOrder(index);
  }
}
