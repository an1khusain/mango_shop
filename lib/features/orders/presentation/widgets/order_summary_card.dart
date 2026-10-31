import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const OrderSummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color:
              Colors.black.withOpacity(0.05),
              blurRadius: 8,
            ),
          ],
        ),

        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.orange,
              size: 30,
            ),

            const SizedBox(height: 8),

            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}