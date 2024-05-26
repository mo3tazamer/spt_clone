import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_colors.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/core/utils/sizes.dart';
import 'package:spt_clone/features/home/presentation/widgets/custom_app_bar.dart';

import '../../../../core/utils/app_strings.dart';
import '../widgets/what_they_say_about_us.dart';

class SayAboutUsScreen extends StatefulWidget {
  const SayAboutUsScreen({super.key});

  @override
  State<SayAboutUsScreen> createState() => _SayAboutUsScreenState();
}

class _SayAboutUsScreenState extends State<SayAboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(AppStrings.whatCustomersSaidAboutUs.tr(),
            style:
                AppTextStyles.style16.copyColorWith(AppColors.whiteTextColor)),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.s8.dm),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: AppSizes.s8.h,
          ),
          itemCount: 5,
          itemBuilder: (context, index) => card(),
        ),
      ),
    );
  }
}
