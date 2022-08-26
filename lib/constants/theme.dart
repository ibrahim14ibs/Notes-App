import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

const FlexScheme usedScheme = FlexScheme.jungle;

ThemeData theme() {
  return FlexColorScheme.light(
    scheme: usedScheme,
    appBarStyle: FlexAppBarStyle.background,
    transparentStatusBar: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
  ).toTheme;
}

ThemeData themeDark() {
  return FlexColorScheme.dark(
    scheme: usedScheme,
    appBarStyle: FlexAppBarStyle.background,
    transparentStatusBar: true,
    darkIsTrueBlack: true,
    tooltipsMatchBackground: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
  ).toTheme;
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(width: 0.5, color: kBorderColor),
  );
  OutlineInputBorder focusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(width: 0.5, color: kPrimaryColor),
  );
  return InputDecorationTheme(
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedInputBorder,
    border: outlineInputBorder,
    filled: true,
  );
}
