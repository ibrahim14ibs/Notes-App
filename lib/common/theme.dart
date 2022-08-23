import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

const FlexScheme usedScheme = FlexScheme.jungle;

ThemeData theme() {
  return FlexColorScheme.light(
    scheme: usedScheme,
    appBarStyle: FlexAppBarStyle.background,
    transparentStatusBar: true,
    // fontFamily: 'Raleway',

    // surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    // blendLevel: 0,
    // appBarOpacity: 0.5,
    // // useSubThemes: true,
    // lightIsWhite: true,
    // subThemesData: FlexSubThemesData(
    //   elevatedButtonRadius: 10.0,
    //   textButtonRadius: 10.0,
    //   outlinedButtonRadius: 10.0,
    //   cardRadius: 10.0,
    //   cardElevation: .5,
    //   bottomNavigationBarElevation: 25,
    //   bottomSheetRadius: 10,
    // ),
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
    // fontFamily: 'Raleway',
    // surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    // blendLevel: 0,
    // appBarOpacity: 0.5,
    // subThemesData: FlexSubThemesData(
    //   elevatedButtonRadius: 10.0,
    //   textButtonRadius: 10.0,
    //   outlinedButtonRadius: 10.0,
    //   cardRadius: 10.0,
    //   cardElevation: 1,
    //   bottomSheetRadius: 10,
    // ),
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
    // contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedInputBorder,
    border: outlineInputBorder,
    filled: true,
  );
}
