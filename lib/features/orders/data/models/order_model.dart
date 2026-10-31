import 'package:hive/hive.dart';
import '../../domain/entities/order_entity.dart';

part 'order_model.g.dart';

@HiveType(typeId: 0)
class OrderModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String customerName;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String mangoType;

  @HiveField(4)
  int quantity;

  @HiveField(5)
  double totalPrice;

  @HiveField(6)
  String status;

  @HiveField(7)
  String paymentStatus;

  OrderModel({
    required this.id,
    required this.customerName,
    required this.phone,
    required this.mangoType,
    required this.quantity,
    required this.totalPrice,
    required this.status,
    required this.paymentStatus,
  });

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      customerName: customerName,
      phone: phone,
      mangoType: mangoType,
      quantity: quantity,
      totalPrice: totalPrice,
      status: status,
      paymentStatus: paymentStatus,
    );
  }

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      customerName: entity.customerName,
      phone: entity.phone,
      mangoType: entity.mangoType,
      quantity: entity.quantity,
      totalPrice: entity.totalPrice,
      status: entity.status,
      paymentStatus: entity.paymentStatus,
    );
  }
}