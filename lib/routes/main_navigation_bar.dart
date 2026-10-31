import 'package:flutter/material.dart';
import 'package:mango_shop/features/customers/presentation/pages/customer_page.dart';
import 'package:mango_shop/features/inventory/presentation/pages/inventory_page.dart';
import 'package:mango_shop/features/settings/pages/settings_page.dart';

import '../features/dashboard/presentation/pages/dashboard_page.dart';
import '../features/orders/presentation/pages/orders_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() =>
      _MainNavigationPageState();
}

class _MainNavigationPageState
    extends State<MainNavigationPage> {

  int currentIndex = 0;

  final pages = [
    const DashboardPage(),
    const OrdersPage(),
    const InventoryPage(),
    const CustomersPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Inventory',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Customers',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}