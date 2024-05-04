import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spt_clone/auth/presentation/widgets/svg_image.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_textstyles.dart';
import '../../../core/utils/sizes.dart';


class AppMainButton extends StatelessWidget {
  const AppMainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fillColor = AppColors.whitePrimaryColor,
    this.borderRadius = AppSizes.s48,
    this.width = double.maxFinite,
    this.height = AppSizes.s56,
    this.child,
    this.borderColor,
    this.textColor = Colors.white,
    this.inactiveColor,
    this.inactiveTextColor,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color fillColor;
  final Color? borderColor;
  final Color? inactiveColor;
  final Color? inactiveTextColor;
  final Color textColor;
  final double borderRadius;
  final double width;
  final double height;

  factory AppMainButton.icon({
    required String icon,
    required VoidCallback? onPressed,
    Color fillColor = AppColors.whitePrimaryColor,
    double width = double.maxFinite,
    double height = AppSizes.s56,
    double borderRadius = AppSizes.s48,
  }) =>
      AppMainButton(
        text: null,
        onPressed: onPressed,
        fillColor: fillColor,
        width: width,
        height: height,
        borderRadius: borderRadius,
        child: AppSvgImage(
          image: icon,
          width: AppSizes.s30,
          height: AppSizes.s30,
          color: Colors.white,
        ),
      );
  factory AppMainButton.outlined({
    required String text,
    required VoidCallback? onPressed,
    Color fillColor = AppColors.redColor,
    double width = double.maxFinite,
    double height = AppSizes.s56,
    double borderRadius = AppSizes.s48,
    Color borderColor = AppColors.whitePrimaryColor,
    Color textColor = AppColors.regularTextColor,
  }) =>
      AppMainButton(
        text: text,
        onPressed: onPressed,
        fillColor: fillColor,
        width: width,
        height: height,
        borderRadius: borderRadius,
        borderColor: borderColor,
        textColor: textColor,
      );

  @override
  Widget build(BuildContext context) {
    //Color(0xFFFFE1E1)
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: onPressed == null
          ? inactiveColor ?? const Color(0xfffff9f9)
          : fillColor,
      elevation: AppSizes.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        side: borderColor != null
            ? BorderSide(
          color:
          onPressed == null ? const Color(0xfff4d4d4) : borderColor!,
        )
            : BorderSide.none,
      ),
      constraints: BoxConstraints.tightFor(
        width: (width / 100).sw,
        height: height.h,
      ),
      child: child ??
          (text != null
              ? Text(
            text!,
            style: AppTextStyles.style15.copyWith(
              color: onPressed == null
                  ? inactiveTextColor ?? const Color(0xfff4d4d4)
                  : textColor,
              fontWeight: FontWeight.w600,
            ),
          )
              : null),
    );
  }
}
