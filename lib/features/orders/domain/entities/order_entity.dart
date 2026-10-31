import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final int id;
  final String customerName;
  final String phone;
  final String mangoType;
  final int quantity;
  final double totalPrice;
  final String status;
  final String paymentStatus;

  const OrderEntity({
    required this.id,
    required this.customerName,
    required this.phone,
    required this.mangoType,
    required this.quantity,
    required this.totalPrice,
    required this.status,
    required this.paymentStatus,
  });

  @override
  List<Object?> get props => [
    id,
    customerName,
    phone,
    mangoType,
    quantity,
    totalPrice,
    status,
    paymentStatus,
  ];
}