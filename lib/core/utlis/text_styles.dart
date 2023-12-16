import 'package:bookly/core/utlis/assets.dart';
import 'package:bookly/core/utlis/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle titleMedium = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: AssetsData.primaryFontFamily,
      color: Colors.white);

  static const TextStyle bookTitleStyle = TextStyle(
      fontSize: 18,
      fontFamily: AssetsData.gTSectraFineFamily,
      color: Colors.white);

  static const TextStyle authonStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: AssetsData.primaryFontFamily,
      color: ThemeColors.secondaryTextColor);
}
