import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/customer_provider.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() =>
      _AddCustomerPageState();
}

class _AddCustomerPageState
    extends State<AddCustomerPage> {

  final nameController =
  TextEditingController();

  final phoneController =
  TextEditingController();

  final districtController =
  TextEditingController();

  final addressController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Customer Name',
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: phoneController,
              keyboardType:
              TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: districtController,
              decoration: const InputDecoration(
                labelText: 'District',
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: addressController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<CustomerProvider>()
                      .addCustomer({
                    "name": nameController.text,
                    "phone": phoneController.text,
                    "district": districtController.text,
                    "dueAmount": 0.0,
                  });
                    Navigator.pop(context);
                  },
                child: const Text(
                  'Save Customer',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}