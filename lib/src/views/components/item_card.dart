import 'dart:io';

import 'package:flutter/material.dart';
import 'package:product_catalog_app/src/utils/colours.dart';
import 'package:product_catalog_app/src/utils/constants.dart';
import 'package:product_catalog_app/src/utils/dimensions.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.text,
    required this.img,
    required this.onTap,
    this.maxLines = 2,
  });

  final String text, img;
  final VoidCallback onTap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Consts.kBorderRadiusTen),
      child: Ink(
        width: ResponsiveSize.setWidth(45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Consts.kBorderRadiusTen),
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Consts.kBorderRadiusTen),
              child: Image.file(File(img), fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                height: ResponsiveSize.setHeight(10),
                alignment: Alignment.bottomCenter,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(Consts.kBorderRadiusTen),
                    bottomLeft: Radius.circular(Consts.kBorderRadiusTen),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colours.black.withOpacity(0.3),
                      Colours.transparent,
                    ],
                  ),
                ),
                child: Text(
                  text,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colours.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
