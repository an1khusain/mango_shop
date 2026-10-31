import 'package:flutter/material.dart';
import 'package:mango_shop/features/orders/presentation/pages/edit_order_page.dart';
import '../../domain/entities/order_entity.dart';
import '../widgets/order_stutus_chip.dart';
import '../widgets/payment_status_chip.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderEntity order;
  final int index;

  const OrderDetailsPage({
    super.key,
    required this.order,
    required this.index,
  });

  Widget _buildInfoTile(
      String title,
      String value,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        title: const Text(
          'Order Details',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius:
                BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 50,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    order.customerName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    order.phone,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                const Text(
                  'Order Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (_) => EditOrderPage(order: order, index: index),
                         ),
                       );
                     }, icon: Icon(Icons.edit, color: Colors.black, size: 18,),),

              ],
            ),

            const SizedBox(height: 12),

            _buildInfoTile(
              'Mango Type',
              order.mangoType,
            ),

            _buildInfoTile(
              'Quantity',
              '${order.quantity} KG',
            ),

            _buildInfoTile(
              'Total Price',
              '৳ ${order.totalPrice}',
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: OrderStatusChip(
                    status: order.status,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PaymentStatusChip(
                    paymentStatus:
                    order.paymentStatus,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.call),
                label: const Text(
                  'Contact Customer',
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}