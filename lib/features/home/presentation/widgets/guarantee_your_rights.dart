import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_strings.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_textstyles.dart';

class GuaranteeYourRights extends StatefulWidget {
  const GuaranteeYourRights({super.key});

  @override
  State<GuaranteeYourRights> createState() => _GuaranteeYourRightsState();
}

class _GuaranteeYourRightsState extends State<GuaranteeYourRights> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Ink(
            height: 91.h,
            width: 327.w,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                color: Colors.black),
          ),
          Positioned(
              left: 20.w, top: 20.h, child: Image.asset(ImagesAssets.car)),
          Positioned(
              right: 20.w,
              top: 20.h,
              child: Column(
                children: [
                  Text(
                    AppStrings.howWeGuarantee.tr(),
                    style: AppTextStyles.style14.copyWith(color: Colors.white),
                  ),
                  Text(
                    AppStrings.yourRights.tr(),
                    style: AppTextStyles.style24.copyWith(color: Colors.white),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
