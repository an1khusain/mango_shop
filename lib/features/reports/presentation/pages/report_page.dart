import 'package:flutter/material.dart';
import 'package:mango_shop/features/reports/presentation/pages/sale_report_page.dart';
import '../widgets/report_card.dart';
import 'profit_report_page.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ReportCard(
              title: 'Sales Report',
              value: '৳58,000 Sales',
              icon: Icons.bar_chart,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const SalesReportPage(),
                  ),
                );
              },
            ),

            ReportCard(
              title: 'Profit Report',
              value: '৳18,000 Profit',
              icon: Icons.trending_up,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                    const ProfitReportPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}