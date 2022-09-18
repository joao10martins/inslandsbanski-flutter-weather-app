import 'package:flutter/material.dart';

@immutable
abstract class ColorPalette {
  const ColorPalette._();

  static const Color kPrimaryColor = Color(0xffEB5064);
  static const Color kSecondaryColor = Color(0xffE2989A);
  static const Color kSecondaryDarkerColor = Color(0xffBD8182);

  static const Color kTextColor = Color(0xffF3EED9);
  static const Color kCardBackGroundColor = Color(0xffFFF6F6);
  static const Color kTextSecondaryColor = Color(0xff798897);
}
