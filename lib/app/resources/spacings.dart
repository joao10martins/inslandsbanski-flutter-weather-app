import 'package:flutter/cupertino.dart';

import 'package:weather_app/app/resources/dimensions.dart';
import 'package:weather_app/core/common/widgets/spacing.dart';

@immutable
abstract class Spacings {
  const Spacings._();

  static const xxxsSize = Spacing(Dimensions.xxxsSize);
  static const xxsSize = Spacing(Dimensions.xxsSize);
  static const xsSize = Spacing(Dimensions.xsSize);
  static const sSize = Spacing(Dimensions.sSize);
  static const smSize = Spacing(Dimensions.smSize);
  static const mSize = Spacing(Dimensions.mSize);
  static const mlSize = Spacing(Dimensions.mlSize);
  static const lSize = Spacing(Dimensions.lSize);
  static const xlSize = Spacing(Dimensions.xlSize);
  static const xxlSize = Spacing(Dimensions.xxlSize);
  static const xxxlSize = Spacing(Dimensions.xxxlSize);
}
