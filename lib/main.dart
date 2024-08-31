import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_catalog_app/src/routes/routes.dart';
import 'package:product_catalog_app/src/utils/dimensions.dart';
import 'package:product_catalog_app/src/utils/themes.dart';

void main() {
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
