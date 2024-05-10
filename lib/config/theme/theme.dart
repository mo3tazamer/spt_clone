import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spt_clone/core/utils/app_colors.dart';
import 'package:spt_clone/core/utils/app_constants.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: AppConstants.fontFamilyAr,
    scaffoldBackgroundColor: AppColors.whitePrimaryColor,
    primaryColor: AppColors.primary,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(

        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
  );
}
