import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/features/home/presentation/widgets/custom_app_bar.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../../../core/utils/sizes.dart';
import '../../../auth/presentation/widgets/svg_image.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({super.key});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('تفاصيل المتجر',
            style:
                AppTextStyles.style16.copyColorWith(AppColors.whiteTextColor)),
      ),
      extendBody: true,
      body: Padding(
        padding:  EdgeInsets.all(8.0.dm),
        child: ListView(
          physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
          children: [
            _storeDetails(),
            Text(
              'الموقع',
              style: AppTextStyles.style14gray.bold
                  .copyColorWith(AppColors.boldTextColor),
            ),
            Image.asset(
              ImagesAssets.mapImage,
              fit: BoxFit.scaleDown,
            ),
             SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                AppSvgImage(
                  image: IconAssets.deliveryIcon,
                  height: AppSizes.s30.h,
                  width: AppSizes.s30.w,
                  color: AppColors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('هل يوفر خدمة  التوصيل و الشحن ؟'),
                const Spacer(),
                AppSvgImage(
                  image: IconAssets.askAnswerMarkWrong,
                  height: AppSizes.s30.h,
                  width: AppSizes.s30.w,
                  color: AppColors.black,
                ),
              ],
            ),
             SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                AppSvgImage(
                  image: IconAssets.videoIcon,
                  height: AppSizes.s30.h,
                  width: AppSizes.s30.w,
                  color: AppColors.black,
                ),
                 SizedBox(
                  width: 5.w,
                ),
                const Text(' امكانية التواصل المرئى مع العميل ؟'),
                const Spacer(),
                AppSvgImage(
                  image: IconAssets.askAnswerMarkWrong,
                  height: AppSizes.s30.h,
                  width: AppSizes.s30.w,
                  color: AppColors.black,
                ),
              ],
            ),
             SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                AppSvgImage(
                  image: IconAssets.micIcon,
                  height: AppSizes.s30.h,
                  width: AppSizes.s30.w,
                  color: AppColors.black,
                ),
                 SizedBox(
                  width: 5.w,
                ),
                const Text(' امكانية التواصل الصوتى مع العميل ؟'),
                const Spacer(),
                AppSvgImage(
                  image: IconAssets.askAnswerMarkRight,
                  height: AppSizes.s30.h,
                  width: AppSizes.s30.w,
                  color: AppColors.black,
                ),
              ],
            ),
             SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _storeDetails() {
  return Container(
    height: 420.h,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.lightWhite,
      borderRadius: BorderRadius.circular(20.dm),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.dm),
            color: AppColors.borderColor,
          ),
          height: AppSizes.s72.h,
          width: AppSizes.s72.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppSvgImage(
                fit: BoxFit.scaleDown,
                image: IconAssets.carService,
                color: Colors.black,
              ),
              Text(
                'ورش الصيانة',
                style: AppTextStyles.style12,
              ),
            ],
          ),
        ),
         SizedBox(
          height: 5.h,
        ),
        const Text('اسم المتجر'),
         SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            AppSvgImage(
              image: IconAssets.locationIcon,
              color: Colors.black,
              fit: BoxFit.scaleDown,
              height: AppSizes.s30.h,
              width: AppSizes.s30.w,
            ),
            SizedBox(
              width: 5.w,
            ),
            const Text('عنوان المتجر'),
            const Spacer(),
            const Text(' 706 Zayed The First St - Al Hisn'),
          ],
        ),
        const Divider(
          color: AppColors.borderColor,
        ),
        Row(
          children: [
            AppSvgImage(
              image: IconAssets.rateIcon,
              color: Colors.black,
              fit: BoxFit.scaleDown,
              height: AppSizes.s30.h,
              width: AppSizes.s30.w,
            ),
            SizedBox(
              width: 5.w,
            ),
            const Text('التقييمات'),
            const Spacer(),
            const Text(' 4.3'),
          ],
        ),
        const Divider(
          color: AppColors.borderColor,
        ),
        Row(
          children: [
            AppSvgImage(
              image: IconAssets.orderIcon,
              color: Colors.black,
              fit: BoxFit.scaleDown,
              height: AppSizes.s30.h,
              width: AppSizes.s30.w,
            ),
            SizedBox(
              width: 5.w,
            ),
            const Text('الطلبات المنفذة'),
            const Spacer(),
            const Text(' 1346'),
          ],
        ),
        const Divider(
          color: AppColors.borderColor,
        ),
        Row(
          children: [
            AppSvgImage(
              image: IconAssets.storeService,
              color: Colors.black,
              fit: BoxFit.scaleDown,
              height: AppSizes.s30.h,
              width: AppSizes.s30.w,
            ),
            SizedBox(
              width: 5.w,
            ),
            const Text('خدمات المتجر'),
          ],
        ),
         SizedBox(height: 8.h),
        const Text('خدمة الصيانة - خدمة نقل السيارات'),
        Row(
          children: [
            AppSvgImage(
              image: IconAssets.storeService,
              color: Colors.black,
              fit: BoxFit.scaleDown,
              height: AppSizes.s30.h,
              width: AppSizes.s30.w,
            ),
            SizedBox(
              width: 5.w,
            ),
            const Text('الفروع'),
          ],
        ),
         SizedBox(height: 8.h),
        const Text('اسم الفرع - اسم الفرع'),
        const SizedBox(height: 5),
      ],
    ),
  );
}
