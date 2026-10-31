import 'package:flutter/material.dart';

class OrderSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const OrderSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      onChanged: onChanged,

      decoration: InputDecoration(
        hintText: 'Search orders...',
        prefixIcon: const Icon(Icons.search),

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),
        ),
      ),
    );
  }
}