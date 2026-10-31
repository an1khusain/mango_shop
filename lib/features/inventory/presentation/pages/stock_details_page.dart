import 'package:flutter/material.dart';

class StockDetailsPage
    extends StatelessWidget {
  final String mangoName;
  final double purchasePrice;

  const StockDetailsPage({
    super.key,
    required this.mangoName,
    required this.purchasePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text('$mangoName Details'),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title:
              const Text('Purchase Price'),
              trailing:
              Text('৳$purchasePrice/KG'),
            ),
            const Divider(),
            const ListTile(
              title:
              Text('Available Stock'),
              trailing:
              Text('120 KG'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Sold'),
              trailing:
              Text('40 KG'),
            ),
            const Divider(),
            const ListTile(
              title:
              Text('Remaining'),
              trailing:
              Text('80 KG'),
            ),
          ],
        ),
      ),
    );
  }
}