import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:product_catalog_app/src/utils/colours.dart';
import 'package:product_catalog_app/src/utils/constants.dart';
import 'package:product_catalog_app/src/views/screens/search_delegate.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: InkWell(
        onTap: () => showSearch(
          context: context,
          delegate: AppSearchDelegate(),
        ),
        borderRadius: BorderRadius.circular(Consts.kBorderRadiusTen),
        child: Ink(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colours.white,
            border: Border.all(
              color: Colours.primary.withOpacity(0.5),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(Consts.kBorderRadiusTen),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: Colours.grey.withOpacity(0.5),
              ),
              const Gap(5.0),
              Text(
                "Search...",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colours.grey.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
