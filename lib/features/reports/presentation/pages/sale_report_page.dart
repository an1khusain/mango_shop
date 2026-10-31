import 'package:flutter/material.dart';

class SalesReportPage extends StatelessWidget {
  const SalesReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            ListTile(
              title: Text('Today'),
              trailing: Text('৳4,500'),
            ),
            Divider(),
            ListTile(
              title: Text('This Week'),
              trailing: Text('৳18,000'),
            ),
            Divider(),
            ListTile(
              title: Text('This Month'),
              trailing: Text('৳58,000'),
            ),
          ],
        ),
      ),
    );
  }
}