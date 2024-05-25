import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_assets.dart';
import 'package:spt_clone/core/utils/app_colors.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_strings.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';

import '../../../../core/utils/sizes.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

/// handel when get api
class _HomeCategoriesState extends State<HomeCategories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _categoryCircle(
            ImagesAssets.cateigores1,
            AppStrings.requestSpareParts.tr(),
          ),
          _categoryCircle(
            ImagesAssets.cateigores2,
            AppStrings.requestTow.tr(),
          ),
          _categoryCircle(
            ImagesAssets.cateigores3,
            AppStrings.sellingCarForRepairs.tr(),
          ),
        ],
      ),
    );
  }
}

// List<String> get categories => [
//       ImagesAssets.cateigores1,
//       ImagesAssets.cateigores2,
//       ImagesAssets.cateigores3,
//     ];
// List<String> get categoriesName => [
//       AppStrings.requestSpareParts,
//       AppStrings.requestTow,
//       AppStrings.sellingCarForRepairs,
//     ];

Widget _categoryCircle(
  String image,
  String title,
) {
  return Expanded(
    child: InkWell(
      borderRadius: BorderRadius.all(Radius.circular(25.0.dm)),
      onTap: () {},
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Ink(
            height: AppSizes.s250.h,
            width: AppSizes.s100.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(image),
              ),
            ),
          ),
          Positioned(
              child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.s3.w, vertical: AppSizes.s3.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0.dm)),
              color: AppColors.black,
            ),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyles.style12.copyColorWith(Colors.white),
            ),
          )),
        ],
      ),
    ),
  );
}
