import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_app/src/views/screens/home_screen.dart';
import 'package:product_catalog_app/src/views/screens/notifications_screen.dart';
import 'package:product_catalog_app/src/views/screens/product_details_screen.dart';
import 'package:product_catalog_app/src/views/screens/new_product_screen.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      pageBuilder: (context, state) => const MaterialPage(
        child: HomeScreen(),
      ),
      routes: [
        GoRoute(
          path: ProductDetailsScreen.path,
          name: ProductDetailsScreen.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: ProductDetailsScreen(),
          ),
        ),
        GoRoute(
          path: NewProductScreen.path,
          name: NewProductScreen.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: NewProductScreen(),
          ),
        ),
        GoRoute(
          path: NotificationsScreen.path,
          name: NotificationsScreen.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: NotificationsScreen(),
          ),
        ),
      ],
    ),
  ],
);
