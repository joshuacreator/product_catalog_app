import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_app/src/models/product.dart';
import 'package:product_catalog_app/src/utils/constants.dart';
import 'package:product_catalog_app/src/views/components/item_card.dart';
import 'package:product_catalog_app/src/views/components/section_title.dart';
import 'package:product_catalog_app/src/views/screens/product_details_screen.dart';

Widget buildProductGridView({
  required List<Product> products,
}) {
  return Column(
    children: [
      GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ItemCard(
          text: products[index].name,
          img: products[index].image,
          onTap: () {
            context.pushNamed(
              ProductDetailsScreen.name,
              pathParameters: {"productIndex": index.toString()},
              extra: products[index],
            );
          },
        ),
      ),
    ],
  );
}

Widget buildProductHorizontalList({
  required String categoryTitle,
  required double height,
  required List<Product> products,
}) {
  return Column(
    children: [
      SectionTitle(text: categoryTitle, padding: 10.0),
      const Gap(10.0),
      SizedBox(
        height: height,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: Consts.kPadding),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => ItemCard(
            text: products[index].name,
            img: products[index].image,
            maxLines: 1,
            onTap: () {
              context.pushNamed(
                ProductDetailsScreen.name,
                extra: products[index],
              );
            },
          ),
          separatorBuilder: (context, index) => const Gap(10.0),
          itemCount: products.length,
        ),
      ),
    ],
  );
}
