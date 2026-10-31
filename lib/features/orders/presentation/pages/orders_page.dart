import 'package:flutter/material.dart';
import 'package:mango_shop/features/orders/presentation/pages/order_details_page.dart';
import 'package:provider/provider.dart';

import '../provider/order_provider.dart';
import 'add_order_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<OrderProvider>().loadOrders();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OrderProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddOrderPage(),
            ),
          );
        },
      ),

      body: provider.orders.isEmpty
          ? const Center(
        child: Text('No Orders Found'),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: provider.orders.length,
        itemBuilder: (context, index) {
          final order = provider.orders[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),

            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsPage(order: order, index: index,),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor:
                Colors.orange.withOpacity(0.1),

                child: const Icon(
                  Icons.shopping_bag,
                  color: Colors.orange,
                ),
              ),

              title: Text(order.customerName),

              subtitle: Text(
                '${order.mangoType} • ${order.quantity}kg',
              ),

              trailing: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [
                  Text(
                    '৳ ${order.totalPrice}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    order.status,
                    style: TextStyle(
                      color: order.status == 'Delivered'
                          ? Colors.green
                          : Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}