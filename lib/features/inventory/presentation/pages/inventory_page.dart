import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/invertory_provider.dart';
import '../widgets/stock_card.dart';
import 'add_stock_page.dart';
import 'stock_details_page.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final inventory = [
      {"name": "Himsagor", "available": 120, "sold": 40},
      {"name": "Langra", "available": 90, "sold": 25},
      {"name": "Amrapali", "available": 70, "sold": 15},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Stock',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      Consumer<InventoryProvider>(
                        builder: (context,provider,_) {
                          return Text(
                            '${provider.totalStock} KG',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                  const Icon(Icons.inventory, color: Colors.white, size: 40),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Consumer<InventoryProvider>(
                builder: (context, provider, _) {
                  if (provider.inventoryList.isEmpty) {
                    return const Center(
                      child: Text('No stock available'),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.inventoryList.length,
                    itemBuilder: (context, index) {
                      final stock = provider.inventoryList[index];

                      return StockCard(
                        mangoName: stock.mangoName,
                        availableKg: stock.quantity.toInt(),
                        soldKg: 0, // Replace with stock.soldQuantity if you add it later

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => StockDetailsPage(
                                mangoName: stock.mangoName,
                                purchasePrice: stock.purchasePrice,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddStockPage()),
          );
        },
      ),
    );
  }
}
