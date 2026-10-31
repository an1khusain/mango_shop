import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final String name;
  final String phone;
  final String district;
  final String dueAmount;
  final VoidCallback onTap;

  const CustomerCard({
    super.key,
    required this.name,
    required this.phone,
    required this.district,
    required this.dueAmount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Colors.orange.shade100,
          child: Text(
            name[0],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(name),
        subtitle: Text('$phone • $district'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Due',
              style: TextStyle(fontSize: 12),
            ),
            Text(
              dueAmount,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}