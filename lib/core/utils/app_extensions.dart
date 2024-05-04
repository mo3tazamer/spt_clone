
import 'package:flutter/material.dart';

import 'app_colors.dart';
extension TextStylesCopyWith on TextStyle {
  TextStyle get bold => copyWith(
    fontWeight: FontWeight.bold,
  );
  TextStyle get grey => copyColorWith(
    AppColors.regularTextColor,
  );
  TextStyle get withPrimaryColor => copyWith(
    color: AppColors.boldTextColor,
  );
  TextStyle copyColorWith(Color? color) => copyWith(
    color: color,
  );

}