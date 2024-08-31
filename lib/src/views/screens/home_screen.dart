import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_app/src/utils/assets.dart';
import 'package:product_catalog_app/src/utils/constants.dart';
import 'package:product_catalog_app/src/utils/dimensions.dart';
import 'package:product_catalog_app/src/views/components/custom_app_bar.dart';
import 'package:product_catalog_app/src/views/components/custom_search_bar.dart';
import 'package:product_catalog_app/src/views/components/item_card.dart';
import 'package:product_catalog_app/src/views/components/section_title.dart';
import 'package:product_catalog_app/src/views/screens/new_product_screen.dart';
import 'package:product_catalog_app/src/views/screens/product_details_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String name = "home", path = "/";

  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // ResponsiveSize.init(context);
    return Scaffold(
      body: ListView(
        children: [
          const Gap(10.0),
          const CustomAppBar(),
          const Gap(10.0),
          const CustomSearchBar(),
          const Gap(10.0),
          buildCategoryHorizontalList(
            categoryTitle: "Trending",
            onMorePressed: () {
              // TODO: Implement function
            },
            maxLines: 1,
            height: ResponsiveSize.setHeight(12),
          ),
          const Gap(10.0),
          buildCategoryHorizontalList(
            categoryTitle: "Not trending",
            onMorePressed: () {
              // TODO: Implement function
            },
            height: ResponsiveSize.setHeight(27),
          ),
          const Gap(10.0),
          buildCategoryGrid(
            categoryTitle: "Maybe trending",
            onMorePressed: () {
              //
            },
          ),
          const Gap(10.0),
          buildCategoryHorizontalList(
            categoryTitle: "Not trending again",
            onMorePressed: () {
              // TODO: Implement function
            },
            height: ResponsiveSize.setHeight(27),
          ),
          const Gap(10.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(NewProductScreen.name);
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

Widget buildCategoryGrid({
  required String categoryTitle,
  required VoidCallback onMorePressed,
  int? maxLines,
}) {
  return Column(
    children: [
      SectionTitle(
        text: categoryTitle,
        padding: 10.0,
        action: TextButton(
          onPressed: onMorePressed,
          child: const Text("more"),
        ),
      ),
      GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: 4,
        itemBuilder: (context, index) => ItemCard(
          text: "This is a featured property. Click to see more. " * 20,
          img: AppImages.placeholder,
          onTap: () {
            context.pushNamed(ProductDetailsScreen.name);
          },
        ),
      ),
    ],
  );
}

Widget buildCategoryHorizontalList({
  required String categoryTitle,
  required VoidCallback onMorePressed,
  int? maxLines,
  required double height,
}) {
  return Column(
    children: [
      SectionTitle(
        text: categoryTitle,
        padding: 10.0,
        action: TextButton(
          onPressed: onMorePressed,
          child: const Text("more"),
        ),
      ),
      SizedBox(
        height: height,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: Consts.kPadding),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => ItemCard(
            text: "This is the title of the item",
            img: AppImages.placeholder,
            maxLines: maxLines ?? 2,
            onTap: () {
              context.pushNamed(ProductDetailsScreen.name);
            },
          ),
          separatorBuilder: (context, index) => const Gap(10.0),
          itemCount: 20,
        ),
      ),
    ],
  );
}
