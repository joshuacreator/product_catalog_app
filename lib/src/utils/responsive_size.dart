import 'package:flutter/material.dart';

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
