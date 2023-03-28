import 'package:pokedex_start/utilities/color_constant.dart';
import 'package:pokedex_start/utilities/constant.dart';
import 'package:flutter/material.dart';

ThemeData getPokedexTheme() {
  return ThemeData().copyWith(
    scaffoldBackgroundColor: lightGreyColor,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(color: primaryColor),
    textTheme: const TextTheme().copyWith(
      bodySmall: const TextStyle(
        fontSize: fontSizeSmallText,
        color: bodyTextColor,
      ),
      headlineSmall: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSizeMediumText,
        color: primaryColor,
      ),
    ),
  );
}
