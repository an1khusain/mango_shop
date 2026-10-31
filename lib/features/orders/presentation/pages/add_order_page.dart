import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/order_entity.dart';
import '../provider/order_provider.dart';

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({super.key});

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  final customerController = TextEditingController();
  final phoneController = TextEditingController();
  final mangoController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Order'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: customerController,
                decoration: const InputDecoration(
                  labelText: 'Customer Name',
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: mangoController,
                decoration: const InputDecoration(
                  labelText: 'Mango Type',
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Total Price',
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () async {
                  final order = OrderEntity(
                    id: DateTime.now().millisecondsSinceEpoch,
                    customerName: customerController.text,
                    phone: phoneController.text,
                    mangoType: mangoController.text,
                    quantity: int.parse(quantityController.text),
                    totalPrice: double.parse(priceController.text),
                    status: 'Pending',
                    paymentStatus: 'Unpaid',
                  );

                  await context
                      .read<OrderProvider>()
                      .addOrder(order);

                  Navigator.pop(context);
                },
                child: const Text('Save Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}