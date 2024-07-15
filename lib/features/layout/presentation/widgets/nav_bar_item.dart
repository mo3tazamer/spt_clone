import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/features/auth/presentation/widgets/svg_image.dart';
import '../../../../core/utils/app_colors.dart';

PersistentBottomNavBarItem navBarItem({
  required String icon,
  required String label,
  RouteAndNavigatorSettings routeAndNavigatorSettings =
      const RouteAndNavigatorSettings(),
}) {
  return PersistentBottomNavBarItem(
    inactiveIcon: AppSvgImage(
      image: icon,
      color: AppColors.grayColor,
      fit: BoxFit.contain,
    ),
    textStyle: AppTextStyles.style12,
    icon: AppSvgImage(
      image: icon,
      color: AppColors.redColor,
      fit: BoxFit.contain,
    ),
    title: label,
    routeAndNavigatorSettings: routeAndNavigatorSettings,
    activeColorPrimary: AppColors.redColor,
    inactiveColorPrimary: AppColors.grayColor,
  );
}
