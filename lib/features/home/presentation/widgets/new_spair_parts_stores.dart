import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_assets.dart';
import 'package:spt_clone/core/utils/app_colors.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/features/auth/presentation/widgets/svg_image.dart';

import '../../../../core/utils/sizes.dart';

class NewSpairPartsStores extends StatelessWidget {
  const NewSpairPartsStores({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _partsStores(),
        separatorBuilder: (context, index) => SizedBox(
              width: AppSizes.s8.h,
            ),
        itemCount: 5);
  }
}

Widget _partsStores() {
  return Container(
    width: 177.w,
    padding: EdgeInsets.all(AppSizes.s6.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.borderColor),
    ),
    child: GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'اسم المتجر',
            style: AppTextStyles.style16,
          ),
          SizedBox(
            height: AppSizes.s5.h,
          ),
          AutoSizeText(
            'الرياض',
            style: AppTextStyles.style12,
          ),
          SizedBox(
            height: AppSizes.s5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppSvgImage(
                image: IconAssets.rateIcon,
              ),
              const AutoSizeText('4.6'),
              SizedBox(width: AppSizes.s8.w),
              const AppSvgImage(
                image: IconAssets.locationIcon,
              ),
              const AutoSizeText('4.5'),
            ],
          ),
          SizedBox(
            height: AppSizes.s5.h,
          ),
          AutoSizeText(
            'خدمة الصيانة - خدمة نقل السيارات',
            style: AppTextStyles.style12,
          ),
        ],
      ),
    ),
  );
}
