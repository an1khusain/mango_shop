import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mango_shop/features/inventory/data/datasource/inventory_local_datasource.dart';
import 'package:mango_shop/features/inventory/domain/repositories/inventory_repository.dart';
import 'package:mango_shop/features/inventory/domain/usecases/add_stock_usecase.dart';
import 'package:mango_shop/features/inventory/domain/usecases/delete_stock_usecase.dart';
import 'package:mango_shop/features/inventory/domain/usecases/get_all_stock_usecase.dart';
import 'package:mango_shop/features/inventory/domain/usecases/get_stock_usecase.dart';
import 'package:mango_shop/features/inventory/domain/usecases/update_stock_usecase.dart';
import 'package:mango_shop/features/orders/domain/usecases/delete_order_usecase.dart';
import 'package:mango_shop/routes/main_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'features/customers/presentation/providers/customer_provider.dart';
import 'features/inventory/data/models/inventory_model.dart';
import 'features/inventory/data/repositories/inventory_repository_impl.dart';
import 'features/inventory/presentation/providers/invertory_provider.dart';
import 'features/orders/domain/usecases/get_order_usecase.dart';
import 'features/orders/data/datasource/order_local_datasource.dart';
import 'features/orders/data/models/order_model.dart';
import 'features/orders/data/repositories/order_repository_impl.dart';
import 'features/orders/domain/usecases/add_order_usecase.dart';
import 'features/orders/domain/usecases/update_order_usecase.dart';
import 'features/orders/presentation/provider/order_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(OrderModelAdapter());
  Hive.registerAdapter(InventoryModelAdapter());

  await Hive.openBox<OrderModel>('orders');
  await Hive.openBox<InventoryModel>('inventory');

  final orderBox = Hive.box<OrderModel>('orders');
  final inventoryBox = Hive.box<InventoryModel>('inventory');

  final localDataSource = OrderLocalDataSourceImpl(orderBox);
  final inventoryLocalDataSource =
  InventoryLocalDataSourceImpl(inventoryBox);

  final repository = OrderRepositoryImpl(localDataSource);
  final inventoryRepository = InventoryRepositoryImpl(
    localDataSource: inventoryLocalDataSource,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OrderProvider(
            addOrderUseCase: AddOrderUseCase(repository),
            getOrdersUseCase: GetOrdersUseCase(repository),
            updateOrdersUseCase: UpdateOrderUseCase(repository),
            deleteOrderUseCase: DeleteOrderUseCase(repository),
          ),
        ),

        ChangeNotifierProvider(create: (_) => CustomerProvider()),

        ChangeNotifierProvider(create: (_) => InventoryProvider(
            addStockUseCase: AddStockUseCase(inventoryRepository),
            updateStockUseCase: UpdateStockUseCase(inventoryRepository),
            deleteStockUseCase: DeleteStockUseCase(inventoryRepository),
            getAllStockUseCase: GetAllStockUseCase(inventoryRepository),
            getStockUseCase: GetStockUseCase(inventoryRepository))),
      ],

      child: const MangoBusinessApp(),
    ),
  );
}

class MangoBusinessApp extends StatelessWidget {
  const MangoBusinessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mango Business',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),

      home: const MainNavigationPage(),
    );
  }
}
