import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_catalog_app/src/models/product.dart';
import 'package:product_catalog_app/src/routes/routes.dart';
import 'package:product_catalog_app/src/utils/dimensions.dart';
import 'package:product_catalog_app/src/utils/themes.dart';

void main() async {
  /// Initialize WidgetsFlutterBinding to prevent app from
  /// running without proper initialization
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Hive
  await Hive.initFlutter();

  /// Register ProductAdapter and ProductsAdapter
  Hive.registerAdapter(ProductAdapter());

  /// Open products box on device storage
  await Hive.openBox<Product>("products");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dimensions().init(context);
    ResponsiveSize.init(context);

    return MaterialApp.router(
      title: 'Product Catalogue App',
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
