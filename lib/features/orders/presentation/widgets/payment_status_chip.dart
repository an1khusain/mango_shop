import 'package:flutter/material.dart';

class PaymentStatusChip extends StatelessWidget {
  final String paymentStatus;

  const PaymentStatusChip({
    super.key,
    required this.paymentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: _getColor().withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        paymentStatus,
        style: TextStyle(
          color: _getColor(),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getColor() {
    switch (paymentStatus.toLowerCase()) {
      case 'paid':
        return Colors.green;

      case 'partial':
        return Colors.orange;

      case 'unpaid':
        return Colors.red;

      default:
        return Colors.grey;
    }
  }
}