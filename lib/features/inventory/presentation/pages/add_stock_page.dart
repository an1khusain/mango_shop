import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/inventory.dart';
import '../providers/invertory_provider.dart';

class AddStockPage extends StatefulWidget {
  final Inventory? inventory;

  const AddStockPage({
    super.key,
    this.inventory,
  });

  @override
  State<AddStockPage> createState() => _AddStockPageState();
}

class _AddStockPageState extends State<AddStockPage> {
  late TextEditingController mangoController;
  late TextEditingController quantityController;
  late TextEditingController purchasePriceController;
  late TextEditingController sellingPriceController;

  @override
  void initState() {
    super.initState();

    mangoController = TextEditingController(
      text: widget.inventory?.mangoName ?? '',
    );

    quantityController = TextEditingController(
      text: widget.inventory?.quantity.toString() ?? '',
    );

    purchasePriceController = TextEditingController(
      text: widget.inventory?.purchasePrice.toString() ?? '',
    );

    sellingPriceController = TextEditingController(
      text: widget.inventory?.sellingPrice.toString() ?? '',
    );
  }

  @override
  void dispose() {
    mangoController.dispose();
    quantityController.dispose();
    purchasePriceController.dispose();
    sellingPriceController.dispose();
    super.dispose();
  }

  Future<void> saveStock() async {
    final inventory = Inventory(
      id: widget.inventory?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      mangoName: mangoController.text.trim(),
      quantity: double.parse(quantityController.text),
      purchasePrice: double.parse(purchasePriceController.text),
      sellingPrice: double.parse(sellingPriceController.text),
      lowStockThreshold:
      widget.inventory?.lowStockThreshold ?? 10,
      createdAt: widget.inventory?.createdAt ?? DateTime.now(),
    );

    final provider = context.read<InventoryProvider>();

    if (widget.inventory == null) {
      await provider.addInventory(inventory);
    } else {
      await provider.updateInventory(inventory);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.inventory != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? 'Update Stock' : 'Add Stock',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: mangoController,
              decoration: const InputDecoration(
                labelText: 'Mango Name',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity (KG)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: purchasePriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Purchase Price',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: sellingPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Selling Price',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: saveStock,
                child: Text(
                  isEdit ? 'Update Stock' : 'Save Stock',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}