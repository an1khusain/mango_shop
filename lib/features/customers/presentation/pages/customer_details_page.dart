import 'package:flutter/material.dart';

class CustomerDetailsPage extends StatelessWidget {
  final String customerName;
  final String phone;
  final String district;

  const CustomerDetailsPage({
    super.key,
    required this.customerName,
    required this.phone,
    required this.district,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.orange.shade100,
              child: Text(
                customerName[0],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              customerName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(phone),
            ),

            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(district),
            ),

            const Divider(),

            const ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Total Orders'),
              trailing: Text('8'),
            ),

            const ListTile(
              leading: Icon(Icons.money),
              title: Text('Due Amount'),
              trailing: Text(
                '৳1200',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.call),
                label: const Text('Call Customer'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}