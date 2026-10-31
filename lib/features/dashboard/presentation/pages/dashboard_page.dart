import 'package:flutter/material.dart';
import 'package:mango_shop/features/customers/presentation/pages/customer_page.dart';
import 'package:mango_shop/features/inventory/presentation/pages/inventory_page.dart';
import 'package:mango_shop/features/inventory/presentation/providers/invertory_provider.dart';
import 'package:mango_shop/features/reports/presentation/pages/report_page.dart';
import 'package:provider/provider.dart';
import '../../../customers/presentation/providers/customer_provider.dart';
import '../../../orders/presentation/pages/add_order_page.dart';
import '../../../orders/presentation/provider/order_provider.dart';
import '../widgets/low_stock_tile.dart';
import '../widgets/quick_action_button.dart';
import '../widgets/recent_order_title.dart';
import '../widgets/summary_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: const Text(
          'Mango Business',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.white),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.amber],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning 👋',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Today your mango sales are growing well.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// SUMMARY SECTION
              const Text(
                'Business Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: [
                  const SummaryCard(
                    title: 'Today Sales',
                    value: '৳ 12,500',
                    icon: Icons.attach_money,
                  ),
                  Consumer<OrderProvider>(
                    builder: (_, provider, _) {
                      return SummaryCard(
                        title: 'Orders',
                        value: provider.totalOrders.toString(),
                        icon: Icons.shopping_cart,
                      );
                    },
                  ),
                  Consumer<CustomerProvider>(
                    builder: (_, provider, _) {
                      return SummaryCard(
                        title: 'Customers',
                        value: provider.totalCustomers.toString(),
                        icon: Icons.people,
                      );
                    },
                  ),
                  Consumer<InventoryProvider>(
                    builder: (_, provider, _) {
                      return SummaryCard(
                        title: 'Total Stocks',
                        value: "${provider.totalStock} KG",
                        icon: Icons.wifi_protected_setup,
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// QUICK ACTIONS
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuickActionButton(
                    icon: Icons.add,
                    label: 'Add Order',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AddOrderPage()),
                      );
                    },
                  ),
                  QuickActionButton(
                    icon: Icons.person_add,
                    label: 'Customer',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CustomersPage(),
                        ),
                      );
                    },
                  ),
                  QuickActionButton(
                    icon: Icons.inventory,
                    label: 'Stock',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const InventoryPage(),
                        ),
                      );
                    },
                  ),
                  QuickActionButton(
                    icon: Icons.bar_chart,
                    label: 'Reports',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ReportsPage()),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// RECENT ORDERS
              const Text(
                'Recent Orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              Consumer<OrderProvider>(
                builder: (context,provider,_) {
                  return Column(
                    children: provider.recentOrders.map((order) =>
                      RecentOrderTile(
                        customerName: order.customerName,
                        mangoType: order.mangoType,
                        quantity: "${order.quantity} kg",
                        status: order.status,
                      ),).toList()
                  );
                }
              ),

              const SizedBox(height: 28),

              /// LOW STOCK
              const Text(
                'Low Stock Alert',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              const LowStockTile(
                mangoName: 'Langra Mango',
                remainingStock: '15kg left',
              ),

              const LowStockTile(
                mangoName: 'Fazli Mango',
                remainingStock: '8kg left',
                warningText: 'Restock again',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
