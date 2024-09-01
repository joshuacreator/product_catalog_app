import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_catalog_app/src/models/product.dart';

final productsProvider =
    StateNotifierProvider<ProductListNotifier, List<Product>>(
        (ref) => ProductListNotifier());

class ProductListNotifier extends StateNotifier<List<Product>> {
  ProductListNotifier() : super([]);

  Future<void> loadProducts() async {
    final box = Hive.box<Product>("products");
    final products = box.values.toList();
    state = products;
  }

  Future<void> addProduct(Product product) async {
    final box = Hive.box<Product>("products");
    await box.add(product);
    state = [...state, product];
  }

  Future<void> updateProduct(int index, Product updatedProduct) async {
    final box = Hive.box<Product>("products");
    await box.putAt(index, updatedProduct);
    state = [...state.take(index), updatedProduct, ...state.skip(index + 1)];
  }

  Future<void> deleteProduct(int index) async {
    final box = Hive.box<Product>("products");
    await box.deleteAt(index);
    state = [...state.take(index), ...state.skip(index + 1)];
  }
}
