import 'package:flutter/material.dart';

class ProfitReportPage
    extends StatelessWidget {
  const ProfitReportPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profit Report',
        ),
      ),
      body: Padding(
        padding:
        const EdgeInsets.all(16),
        child: Column(
          children: const [
            ListTile(
              title: Text(
                  'Total Revenue'),
              trailing:
              Text('৳58,000'),
            ),
            Divider(),
            ListTile(
              title: Text(
                  'Total Cost'),
              trailing:
              Text('৳40,000'),
            ),
            Divider(),
            ListTile(
              title:
              Text('Profit'),
              trailing: Text(
                '৳18,000',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}