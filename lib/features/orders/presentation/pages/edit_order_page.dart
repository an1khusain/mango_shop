import 'package:flutter/material.dart';
import 'package:mango_shop/features/orders/presentation/pages/order_details_page.dart';
import 'package:mango_shop/features/orders/presentation/pages/orders_page.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/order_entity.dart';
import '../provider/order_provider.dart';

class EditOrderPage extends StatefulWidget {
  final int index;
  final OrderEntity order;

  const EditOrderPage({
    super.key,
    required this.index,
    required this.order,
  });

  @override
  State<EditOrderPage> createState() => _EditOrderPageState();
}

class _EditOrderPageState extends State<EditOrderPage> {
  late TextEditingController customerController;
  late TextEditingController phoneController;
  late TextEditingController mangoController;
  late TextEditingController quantityController;
  late TextEditingController priceController;

  String orderStatus = 'Pending';
  String paymentStatus = 'Unpaid';

  @override
  void initState() {
    super.initState();

    customerController =
        TextEditingController(text: widget.order.customerName);

    phoneController =
        TextEditingController(text: widget.order.phone);

    mangoController =
        TextEditingController(text: widget.order.mangoType);
    quantityController =
        TextEditingController(text: widget.order.quantity.toString());

    priceController =
        TextEditingController(text: widget.order.totalPrice.toString());

    orderStatus = widget.order.status;
    paymentStatus = widget.order.paymentStatus;
  }

  @override
  void dispose() {
    customerController.dispose();
    phoneController.dispose();
    mangoController.dispose();
    quantityController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future<void> _updateOrder() async {
    final updatedOrder = OrderEntity(
      id: widget.order.id,
      customerName: customerController.text.trim(),
      phone: phoneController.text.trim(),
      mangoType: mangoController.text.trim(),
      quantity: int.parse(quantityController.text),
      totalPrice: double.parse(priceController.text),
      status: orderStatus,
      paymentStatus: paymentStatus,
    );

    if (widget.index >= 0 && widget.index < 4294967295) {
      await context.read<OrderProvider>().updateOrder(
        widget.index,
        updatedOrder,
      );
      if (mounted) {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OrdersPage(),
        ),
      );
      }
    } else {
      // Log or show a SnackBar error if the index passed is completely invalid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: Invalid database index.')),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Order'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField(
              label: 'Customer Name',
              controller: customerController,
            ),

            _buildTextField(
              label: 'Phone',
              controller: phoneController,
            ),

            _buildTextField(
              label: 'Mango Type',
              controller: mangoController,
            ),

            _buildTextField(
              label: 'Quantity (KG)',
              controller: quantityController,
              keyboardType: TextInputType.number,
            ),

            _buildTextField(
              label: 'Total Price',
              controller: priceController,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              initialValue: orderStatus,
              decoration: InputDecoration(
                labelText: 'Order Status',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Pending',
                  child: Text('Pending'),
                ),
                DropdownMenuItem(
                  value: 'Confirmed',
                  child: Text('Confirmed'),
                ),
                DropdownMenuItem(
                  value: 'Packed',
                  child: Text('Packed'),
                ),
                DropdownMenuItem(
                  value: 'Delivered',
                  child: Text('Delivered'),
                ),
                DropdownMenuItem(
                  value: 'Cancelled',
                  child: Text('Cancelled'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  orderStatus = value!;
                });
              },
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: paymentStatus,
              decoration: InputDecoration(
                labelText: 'Payment Status',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Unpaid',
                  child: Text('Unpaid'),
                ),
                DropdownMenuItem(
                  value: 'Partial',
                  child: Text('Partial'),
                ),
                DropdownMenuItem(
                  value: 'Paid',
                  child: Text('Paid'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  paymentStatus = value!;
                });
              },
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  await _updateOrder();
                },
                child: const Text(
                  'Update Order',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}