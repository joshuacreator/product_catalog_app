import 'package:flutter/material.dart';
import 'package:product_catalog_app/src/utils/colours.dart';
import 'package:product_catalog_app/src/utils/constants.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    // scaffoldBackgroundColor: Colours.grey,
    colorScheme: ColorScheme.fromSeed(seedColor: Colours.primary),
    useMaterial3: true,
    dividerTheme: DividerThemeData(
      color: Colours.dividerColour,
      thickness: 3.0,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      // backgroundColor: Colours.grey,
      // surfaceTintColor: Colours.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Consts.kBorderRadiusTen),
          topRight: Radius.circular(Consts.kBorderRadiusTen),
        ),
      ),
    ),
  );

  static ThemeData dark = ThemeData.dark(
    useMaterial3: true,
  );
}
