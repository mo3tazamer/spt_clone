import 'package:flutter/material.dart' show TextStyle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_colors.dart';

import 'app_constants.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle style15 = TextStyle(
    fontFamily: AppConstants.fontFamilyAr,
    fontSize: 15.sp,
    color: AppColors.grayColor,
  );
  static TextStyle style16 = TextStyle(
    fontFamily: AppConstants.fontFamilyAr,
    fontSize: 16.sp,
    color: AppColors.redColor,
  );
  static TextStyle style12 = TextStyle(
    fontSize: 12.sp,
    color: AppColors.grayColor,
  );
  static TextStyle style24 = TextStyle(
    fontSize: 24.sp,
    color: AppColors.boldTextColor,
  );
  static TextStyle style14gray = TextStyle(
    fontSize: 14.sp,
    color: AppColors.grayColor,
  );
  static TextStyle style14 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.boldTextColor,
  );
}
