import 'package:flutter/material.dart';

class CustomerProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _customers = [];

  List<Map<String, dynamic>> get customers =>
      _customers;

  void addCustomer(
      Map<String, dynamic> customer,
      ) {
    _customers.add(customer);

    notifyListeners();
  }

  void updateCustomer(
      int index,
      Map<String, dynamic> customer,
      ) {
    _customers[index] = customer;

    notifyListeners();
  }

  void deleteCustomer(
      int index,
      ) {
    _customers.removeAt(index);

    notifyListeners();
  }

  int get totalCustomers {
    return _customers.length;
  }


  double get totalDueAmount {
    return _customers.fold(
      0.0,
          (sum, customer) =>
      sum +
          (customer['dueAmount'] ?? 0),
    );
  }
}