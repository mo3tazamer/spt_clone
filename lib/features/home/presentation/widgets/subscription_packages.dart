import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_colors.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_strings.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/core/utils/sizes.dart';
import 'package:spt_clone/features/auth/presentation/widgets/svg_image.dart';

import '../../../../core/utils/app_assets.dart';

class SubscriptionPackages extends StatefulWidget {
  const SubscriptionPackages({super.key});

  @override
  State<SubscriptionPackages> createState() => _SubscriptionPackagesState();
}

class _SubscriptionPackagesState extends State<SubscriptionPackages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppStrings.subscriptionPackages.tr(),
              style: AppTextStyles.style16.copyColorWith(AppColors.black).bold,
            ),
            const Spacer(),
            Text(
              AppStrings.viewAll.tr(),
              style: AppTextStyles.style16,
            ),
          ],
        ),
        SizedBox(
          height: AppSizes.s8.h,
        ),
        SizedBox(
          height: AppSizes.s100.h,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _card(),
              SizedBox(
                width: AppSizes.s5.w,
              ),
              _card(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _card() {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(20.dm),
      color: Colors.white,
    ),
    padding: const EdgeInsets.all(8),
    height: AppSizes.s90.h,
    width: AppSizes.s267.w,
    child: IntrinsicHeight(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.dm),
              color: AppColors.borderColor,
            ),
            height: AppSizes.s60.h,
            width: AppSizes.s60.w,
            child: const AppSvgImage(
              fit: BoxFit.scaleDown,
              image: IconAssets.subscriptionIcon,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: AppSizes.s5.h,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.monthlyPackage.tr(),
                style: AppTextStyles.style15.withPrimaryColor.bold,
              ),
              Text(
                AppStrings.oneMonthSubscriptionOneMonthFree.tr(),
                style: AppTextStyles.style12,
                textScaler: const TextScaler.linear(.75),
              ),
              Text(
                AppStrings.riyals150.tr(),
                style: AppTextStyles.style12
                    .copyColorWith(AppColors.redColor)
                    .bold,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
