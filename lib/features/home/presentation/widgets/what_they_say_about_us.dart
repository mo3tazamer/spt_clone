import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/config/routes/app_navigator.dart';
import 'package:spt_clone/config/routes/app_routes.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../../../core/utils/sizes.dart';

class SayAboutUs extends StatefulWidget {
  const SayAboutUs({super.key});

  @override
  State<SayAboutUs> createState() => _SayAboutUsState();
}

class _SayAboutUsState extends State<SayAboutUs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppStrings.whatCustomersSaidAboutUs.tr(),
              style: AppTextStyles.style16.copyColorWith(AppColors.black).bold,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                AppNavigator.navigateNamedTo(
                    context, AppRoutes.sayAboutUsScreen);
              },
              child: Text(
                AppStrings.viewAll.tr(),
                style: AppTextStyles.style16,
              ),
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
              card(),
              SizedBox(
                width: AppSizes.s5.w,
              ),
              card(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget card() {
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
          CircleAvatar(
            maxRadius: 25.dm,
            foregroundImage: Image.asset(ImagesAssets.person1).image,
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'محمد احمد',
                      style: AppTextStyles.style15.withPrimaryColor.bold,
                    ),
                    const Spacer(),
                    Text(
                      '4.3',
                      style: AppTextStyles.style15.withPrimaryColor.bold,
                    ),
                    const Icon(
                      Icons.star,
                    )
                  ],
                ),
                Text(
                  'التطبيق رائع في تجربيته .. انصح الجميع باستخدامة',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  style: AppTextStyles.style12,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
