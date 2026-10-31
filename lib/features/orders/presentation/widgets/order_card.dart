import 'package:flutter/material.dart';
import 'order_stutus_chip.dart';
import 'payment_status_chip.dart';

class OrderCard extends StatelessWidget {
  final String customerName;
  final String mangoType;
  final int quantity;
  final double totalPrice;
  final String orderStatus;
  final String paymentStatus;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.customerName,
    required this.mangoType,
    required this.quantity,
    required this.totalPrice,
    required this.orderStatus,
    required this.paymentStatus,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(18),
      ),

      child: InkWell(
        borderRadius:
        BorderRadius.circular(18),

        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor:
                    Color(0xFFFFF3E0),
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      customerName,
                      style: const TextStyle(
                        fontWeight:
                        FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                '$mangoType • $quantity kg',
              ),

              const SizedBox(height: 8),

              Text(
                '৳ ${totalPrice.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontWeight:
                  FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  OrderStatusChip(
                    status: orderStatus,
                  ),

                  const SizedBox(width: 8),

                  PaymentStatusChip(
                    paymentStatus:
                    paymentStatus,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}