import 'package:flutter/material.dart';
import 'package:weather_app/app/resources/color_palette.dart';

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
      brightness: Brightness.dark,
      backgroundColor: ColorPalette.kPrimaryColor,
      elevation: 0,
    ),
    scaffoldBackgroundColor: ColorPalette.kPrimaryColor,
    primaryColor: ColorPalette.kPrimaryColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
