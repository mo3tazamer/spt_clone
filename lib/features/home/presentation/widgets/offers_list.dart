import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../../../../core/utils/sizes.dart';

class OffersList extends StatelessWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
     
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) => const _OfferItem(),
      separatorBuilder: (context, index) => const SizedBox(
        width: AppSizes.s10,
      ),
    );
  }
}

class _OfferItem extends StatelessWidget {
  const _OfferItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:    EdgeInsets.all(AppSizes.s6.w),
      margin:   EdgeInsets.only(top: AppSizes.s6.h, bottom: AppSizes.s6.h),
        decoration:   BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          border: Border.all(color: AppColors.borderColor),
        ),
      child: SizedBox(
        width: 0.64.sw,
        child: GestureDetector(
          onTap: () {
            // AppNavigator.navigateNamedTo(
            //   context,
            //   AppRoutes.offerDetailsScreen,
            // );
          },
          child: Column(

            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(AppSizes.s6.w),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(ImagesAssets.offerImage),
                    ),
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  // child: Image.asset(
                  //
                  //   ImagesAssets.offerImage,
                  //   width: double.infinity,
                  //   fit: BoxFit.contain,
                  // ),
                ),
              ),
              SizedBox(
                height: AppSizes.s8.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.s6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "عنوان العرض",
                              style: AppTextStyles.style12.bold
                                  .copyColorWith(Colors.black),
                              textAlign: TextAlign.start,
                              minFontSize: AppSizes.s10,
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              "خدمة الصيانة - خدمة نقل السيارات خدمة الصيانة - خدمة نقل السيارات",
                              style: AppTextStyles.style10
                                  .copyColorWith(const Color(0xff4B4B4B)),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              maxFontSize: AppSizes.s8,
                              minFontSize: AppSizes.s7,
                            ),
                          ],
                        ),
                      ),
                      const DottedLine(
                        dashColor: Color(0xFF979797),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: AutoSizeText.rich(
                                TextSpan(
                                  text: "1200 ريال",
                                  style: AppTextStyles.style10.copyWith(
                                    color: const Color(0xff979797),
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "  1000 ريال",
                                      style: AppTextStyles.style10.copyWith(
                                        color: AppColors.redColor,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const OfferDiscount(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OfferDiscount extends StatelessWidget {
  const OfferDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: Sizes.s64,
      // height: Sizes.s28,
      margin: const EdgeInsets.symmetric(vertical: AppSizes.s4),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.s10,
        vertical: AppSizes.s6,
      ),
      decoration: ShapeDecoration(
        color: AppColors.redColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.s10),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        "خصم 50%",
        style: AppTextStyles.style10.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
