import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:product_catalog_app/src/controllers/hive_db_controller.dart';
import 'package:product_catalog_app/src/utils/assets.dart';
import 'package:product_catalog_app/src/utils/constants.dart';
import 'package:product_catalog_app/src/views/components/product_view_build.dart';

enum Filter { name, category }

class AppSearchDelegate extends SearchDelegate {
  Filter filter = Filter.name;

  AppSearchDelegate()
      : super(
          searchFieldStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
          searchFieldLabel: "Search products...",
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = "",
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  PreferredSizeWidget? buildBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Consts.kPadding),
          child: Row(
            children: [
              FilterChip(
                label: const Text("Name"),
                selected: filter == Filter.name,
                onSelected: (value) {
                  setState(() {
                    filter = Filter.name;
                  });
                },
              ),
              Gap(Consts.kPadding),
              FilterChip(
                label: const Text("Category"),
                selected: filter == Filter.category,
                onSelected: (value) {
                  setState(() {
                    filter = Filter.category;
                  });
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchResults();
  }

  Consumer buildSearchResults() {
    return Consumer(
      builder: (context, ref, child) {
        final products = ref.watch(productsProvider).where((e) {
          if (filter == Filter.name) {
            return e.name.toLowerCase().contains(query.toLowerCase().trim());
          }
          if (filter == Filter.category) {
            return e.category
                .toLowerCase()
                .contains(query.toLowerCase().trim());
          }
          return true;
        }).toList();

        return products.isEmpty
            ? Center(child: SvgPicture.asset(AppImages.emptySvg))
            : Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: buildProductGridView(products: products),
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResults();
  }
}
