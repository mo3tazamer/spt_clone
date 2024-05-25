import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_colors.dart';
import 'package:spt_clone/core/utils/app_strings.dart';
import 'package:spt_clone/core/utils/sizes.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_textstyles.dart';

class HelpList extends StatefulWidget {
  const HelpList({super.key});

  @override
  State<HelpList> createState() => _HelpListState();
}

class _HelpListState extends State<HelpList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(15.dm)),
          onTap: () {},
          child: Stack(
            children: [
              Ink(
                width: AppSizes.s156.w,
                height: AppSizes.s90.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: AppColors.lightPurple,
                ),
              ),
              Positioned(
                  right: AppSizes.s3.w,
                  top: AppSizes.s5.h,
                  bottom: AppSizes.s5.h,
                  child: Image.asset(
                    ImagesAssets.phoneHand,
                    fit: BoxFit.scaleDown,
                  )),
              Positioned(
                  left: AppSizes.s5.w,
                  bottom: AppSizes.s10.h,
                  child: Column(
                    children: [
                      Text(
                        AppStrings.howOrderInSpt.tr(),
                        style:
                            AppTextStyles.style14.copyWith(color: Colors.white),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          onTap: () {},
          child: Stack(
            children: [
              Ink(
                width: AppSizes.s156.w,
                height: AppSizes.s90.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.dm)),
                  color: AppColors.lightGray3,
                ),
              ),
              Positioned(
                  right: 25,
                  child: Image.asset(
                    ImagesAssets.carFix,
                    fit: BoxFit.scaleDown,
                  )),
              Positioned(
                  right: AppSizes.s25.w,
                  bottom: AppSizes.s10.h,
                  child: Text(
                    AppStrings.sptHelp.tr(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.style14.copyWith(color: Colors.black),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
