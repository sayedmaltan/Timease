import 'package:flutter/material.dart';

import '../../../constants.dart';

ThemeData buildThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    primarySwatch: kPrimaryColor,
    primaryColor: kPrimaryColor,
    primaryColorLight: kPrimaryColor,
    buttonTheme: ButtonThemeData(buttonColor: kPrimaryColor),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: kPrimaryColor,
      ).copyWith(
        splashFactory: NoSplash.splashFactory,

      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
