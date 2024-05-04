import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_assets.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_strings.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/core/utils/sizes.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_formatters.dart';
import '../widgets/my_Textfiled.dart';
import '../widgets/my_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSizes.s90.h,
                  ),
                  Center(
                      child: Image.asset(ImagesAssets.logo, fit: BoxFit.cover)),
                  SizedBox(
                    height: AppSizes.s48.h,
                  ),
                  Text(
                    AppStrings.logIn.tr(),
                    style: AppTextStyles.style24.bold,
                  ),
                  SizedBox(
                    height: AppSizes.s15.h,
                  ),
                  Text(
                    AppStrings.welcome.tr(),
                    style: AppTextStyles.style14.grey,
                  ),
                  SizedBox(
                    height: AppSizes.s15.h,
                  ),
                  Text(
                    AppStrings.phoneNumber.tr(),
                    style: AppTextStyles.style14.bold,
                  ),
                  SizedBox(
                    height: AppSizes.s15.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: AppSizes.s60.h,
                    child: PhoneFormFiled(
                      validator: (value) {
                        return null;
                      },
                      borderColor: AppColors.borderColor,
                      borderSize: AppSizes.s4,
                      inputFormatters: [
                        AppInputFormatters.lengthLimitingTextInputFormatter(9),
                        AppInputFormatters.denyArabicNumbers,
                        AppInputFormatters.denySpace,
                        AppInputFormatters.noSpecialCharsFilter
                      ],
                      hintText: AppStrings.phoneNumber.tr(),
                      hintStyle: AppTextStyles.style14gray.grey,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.s28.h,
                  ),
                  AppMainButton(
                    fillColor: AppColors.redColor,
                    text: AppStrings.logIn.tr(),
                    textColor: AppColors.whiteTextColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
