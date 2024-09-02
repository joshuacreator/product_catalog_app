import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_app/src/controllers/hive_db_controller.dart';
import 'package:product_catalog_app/src/models/product.dart';
import 'package:product_catalog_app/src/utils/app_snack_bar.dart';
import 'package:product_catalog_app/src/utils/colours.dart';
import 'package:product_catalog_app/src/utils/currency_formatter.dart';
import 'package:product_catalog_app/src/utils/dimensions.dart';
import 'package:product_catalog_app/src/views/components/desc_box.dart';
import 'package:product_catalog_app/src/views/components/product_view_build.dart';
import 'package:product_catalog_app/src/views/screens/new_product_screen.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  static String name = "product-details", path = "product-details";

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.productIndex,
  });

  final Product product;
  final int productIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsProvider);
    final productController = ref.watch(productsProvider.notifier);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(widget.product.image)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [
              IconButton.filledTonal(
                onPressed: () {
                  context.pushNamed(
                    NewProductScreen.name,
                    pathParameters: {
                      "productIndex": widget.productIndex.toString(),
                    },
                    extra: widget.product,
                  );
                },
                icon: const Icon(Icons.edit_rounded),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  productController
                      .deleteProduct(widget.productIndex)
                      .then((value) {
                    context.pop();
                    showAppSnackBar(context, "Product deleted successfully");
                  });
                },
                icon: const Icon(Icons.delete_rounded),
              ),
            ],
            expandedHeight: ResponsiveSize.setHeight(45),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(10.0),
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currencyFormatter(widget.product.price),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colours.primary,
                            ),
                          ),
                          Text(
                            widget.product.category,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10.0),
                      DescriptionBox(desc: widget.product.description),
                      const Gap(10.0),
                    ],
                  ),
                ),
                Visibility(
                  visible: products.length > 1,
                  child: const Divider(height: 20.0),
                ),
                Visibility(
                  visible: products.length > 1,
                  child: buildProductHorizontalList(
                    categoryTitle: "Other products",
                    height: ResponsiveSize.setHeight(15),
                    products: products,
                  ),
                ),
                const Gap(20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
