import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData mediaQueryData;
  static late double width;
  static late double height;
  static late double widthBlock;
  static late double heightBlock;

  static void initSizeConfig(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
    widthBlock = width / 100;
    heightBlock = height / 100;
  }
}
