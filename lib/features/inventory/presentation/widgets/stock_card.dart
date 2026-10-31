import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final String mangoName;
  final int availableKg;
  final int soldKg;
  double? purchasePrice;
  final VoidCallback onTap;

  StockCard({
    super.key,
    required this.mangoName,
    required this.availableKg,
    required this.soldKg,
    required this.onTap,
    this.purchasePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: const Icon(Icons.inventory),
        ),
        title: Text(mangoName),
        subtitle: Text(
          'Available: $availableKg KG',
        ),
        trailing: Text(
          'Sold: $soldKg KG',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}