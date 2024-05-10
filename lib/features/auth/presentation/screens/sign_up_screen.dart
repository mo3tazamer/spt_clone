import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/shared/widgets/scaffold_red_corner.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_formatters.dart';
import 'package:spt_clone/core/utils/app_strings.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/features/auth/presentation/widgets/my_button.dart';


import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/sizes.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return ScaffoldRedCorner(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.s20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSizes.s90.h,
              ),
              Center(child: Image.asset(ImagesAssets.logo, fit: BoxFit.cover)),
              SizedBox(
                height: AppSizes.s48.h,
              ),
              Text(
                AppStrings.signIn.tr(),
                style: AppTextStyles.style24,
              ),
              SizedBox(height: AppSizes.s10.h,),
              Text(
                AppStrings.registerNow.tr(),
                style: AppTextStyles.style14.grey,
              ),
              SizedBox(height: AppSizes.s10.h,),
              Text(
                AppStrings.firstName.tr(),
                style: AppTextStyles.style14.bold,
              ),
              SizedBox(height: AppSizes.s5.h,),

              AppTextField(
                inputFormatters: [
                  AppInputFormatters.denyArabicNumbers ,
                  AppInputFormatters.nonArabicAndEnglishNumbersFilter,

                ],
                validator: (value) {
                  return null;
                },
                hintStyle: AppTextStyles.style14gray,
                hintText: AppStrings.enterName.tr(),
              ),
              SizedBox(height: AppSizes.s5.h,),
              Text(
                AppStrings.lastName.tr(),
                style: AppTextStyles.style14.bold,
              ),
              SizedBox(height: AppSizes.s5.h,),

              AppTextField(hintText: AppStrings.enterName.tr(),),
              SizedBox(height: AppSizes.s15.h,),
              AppMainButton(
                text: AppStrings.logIn.tr(),
                onPressed: () {},
                fillColor: AppColors.redColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
