import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_catalog_app/src/utils/assets.dart';
import 'package:product_catalog_app/src/utils/colours.dart';
import 'package:product_catalog_app/src/utils/currency_formatter.dart';
import 'package:product_catalog_app/src/utils/dimensions.dart';
import 'package:product_catalog_app/src/views/components/desc_box.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  static String name = "product-details", path = "product-details";

  const ProductDetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.placeholder),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            expandedHeight: Dimensions.height! / 2.3,
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
                      const Text(
                        "widget.property.title",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currencyFormatter(30000),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colours.primary,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10.0),
                      const DescriptionBox(desc: "widget.property.description"),
                      const Gap(10.0),
                      // ReviewsPreviewBox(reviews: widget.property.reviews),
                    ],
                  ),
                ),
                const Divider(height: 40.0),
                const Gap(20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
