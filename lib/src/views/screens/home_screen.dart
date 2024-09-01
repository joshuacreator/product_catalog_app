import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_app/src/controllers/hive_db_controller.dart';
import 'package:product_catalog_app/src/utils/assets.dart';
import 'package:product_catalog_app/src/utils/colours.dart';
import 'package:product_catalog_app/src/views/components/custom_search_bar.dart';
import 'package:product_catalog_app/src/views/components/product_view_build.dart';
import 'package:product_catalog_app/src/views/screens/new_product_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String name = "home", path = "/";

  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.watch(productsProvider.notifier).loadProducts();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ResponsiveSize.init(context);
    final products = ref.watch(productsProvider);

    return Scaffold(
      body: products.isEmpty
          ? Center(child: SvgPicture.asset(AppImages.emptySvg))
          : ListView(
              children: [
                const Gap(10.0),
                buildAppBar(),
                const Gap(10.0),
                const CustomSearchBar(),
                const Gap(20.0),
                buildProductGridView(
                  products: products,
                ),
                const Gap(10.0),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(
            NewProductScreen.name,
            pathParameters: {"productIndex": "0"},
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        'Hi Joshua',
        style: TextStyle(
          color: Colours.primary,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
