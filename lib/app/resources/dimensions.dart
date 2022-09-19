import 'package:flutter/widgets.dart';

@immutable
abstract class Dimensions {
  const Dimensions._();

  static const double zero = 0;
  static const double xxxxsSize = 1;
  static const double xxxsSize = 2;
  static const double xxsSize = 4;
  static const double xsSize = 6;
  static const double sSize = 8;
  static const double smSize = 12;
  static const double mSize = 16;
  static const double mlSize = 20;
  static const double lSize = 24;
  static const double xlSize = 32;
  static const double xxlSize = 36;
  static const double xxxlSize = 40;

  static const EdgeInsets xxxsAllPadding = EdgeInsets.all(xxxsSize);
  static const EdgeInsets xsAllPadding = EdgeInsets.all(xsSize);
  static const EdgeInsets sAllPadding = EdgeInsets.all(sSize);
  static const EdgeInsets smAllPadding = EdgeInsets.all(smSize);
  static const EdgeInsets mAllPadding = EdgeInsets.all(mSize);

  static const EdgeInsets mHorizontalPadding = EdgeInsets.symmetric(horizontal: mSize);
  static const EdgeInsets mVerticalPadding = EdgeInsets.symmetric(vertical: mSize);
  static const EdgeInsets sHorizontalPadding = EdgeInsets.symmetric(horizontal: sSize);
  static const EdgeInsets lVerticalPadding = EdgeInsets.symmetric(vertical: lSize);
  static const EdgeInsets lHorizontalPadding = EdgeInsets.symmetric(horizontal: lSize);
  static const EdgeInsets xlHorizontalPadding = EdgeInsets.symmetric(horizontal: xlSize);

  static final BorderRadius xsBorderRadius = BorderRadius.circular(xsSize);
  static final BorderRadius sBorderRadius = BorderRadius.circular(sSize);
  static final BorderRadius smBorderRadius = BorderRadius.circular(smSize);
  static final BorderRadius mBorderRadius = BorderRadius.circular(mSize);
  static final BorderRadius lBorderRadius = BorderRadius.circular(lSize);

  static const BorderRadius xsReactiveFormBorderRadius = BorderRadius.all(Radius.circular(xsSize));
  static const BorderRadius sReactiveFormBorderRadius = BorderRadius.all(Radius.circular(sSize));
  static const BorderRadius smReactiveFormBorderRadius = BorderRadius.all(Radius.circular(smSize));
  static const BorderRadius mReactiveFormBorderRadius = BorderRadius.all(Radius.circular(mSize));
  static const BorderRadius lReactiveFormBorderRadius = BorderRadius.all(Radius.circular(lSize));
}