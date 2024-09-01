import 'package:flutter/material.dart';

class Dimensions {
  static MediaQueryData? _mediaQuery;
  static double? height;
  static double? width;
  static double? dimension;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    height = _mediaQuery!.size.height;
    width = _mediaQuery!.size.width;

    dimension =
        orientation == Orientation.landscape ? height! * 0.1 : width! * 0.1;
  }
}

final dimension = Dimensions.dimension!;

class ResponsiveSize {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockSizeHorizontal = 0.0;
  static double blockSizeVertical = 0.0;

  static double _safeAreaHorizontal = 0.0;
  static double _safeAreaVertical = 0.0;
  static double safeBlockHorizontal = 0.0;
  static double safeBlockVertical = 0.0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    final padding = MediaQuery.of(context).padding;

    _safeAreaHorizontal = screenWidth - padding.left - padding.right;
    _safeAreaVertical = screenHeight - padding.top - padding.bottom;
    safeBlockHorizontal = _safeAreaHorizontal / 100;
    safeBlockVertical = _safeAreaVertical / 100;
  }

  static double setWidth(double percent) {
    return blockSizeHorizontal * percent;
  }

  static double setHeight(double percent) {
    return blockSizeVertical * percent;
  }

  static double setSafeWidth(double percent) {
    return safeBlockHorizontal * percent;
  }

  static double setSafeHeight(double percent) {
    return safeBlockVertical * percent;
  }
}
