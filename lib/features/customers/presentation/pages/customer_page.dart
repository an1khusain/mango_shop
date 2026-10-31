import 'package:flutter/material.dart';
import 'package:mango_shop/features/customers/presentation/providers/customer_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/customer_card.dart';
import 'add_customer_page.dart';
import 'customer_details_page.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();

}

class _CustomersPageState extends State<CustomersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      body: Consumer<CustomerProvider>(
        builder: (_,provider,_) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.customers.length,
            itemBuilder: (context, index) {
              final customer = provider.customers[index];

              return CustomerCard(
                name: customer['name']!,
                phone: customer['phone']!,
                district: customer['district']!,
                dueAmount: '৳${customer['dueAmount']}',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CustomerDetailsPage(
                        customerName: customer['name']!,
                        phone: customer['phone']!,
                        district: customer['district']!,
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
              const AddCustomerPage(),
            ),
          );
        },
      ),
    );
  }
}