import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_strings.dart';

import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/utils/sizes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/guarantee_your_rights.dart';
import '../widgets/help_list.dart';
import '../widgets/home_categories.dart';
import '../widgets/subscription_packages.dart';
import '../widgets/what_they_say_about_us.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.dm),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.s15.h,
                ),
                AppTextField(
                    constraints:
                        BoxConstraints.tightFor(width: 327.w, height: 60.h),
                    borderSize: 18.dm,
                    hintText: AppStrings.search.tr(),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25.dm,
                    )),
                SizedBox(
                  height: AppSizes.s15.h,
                ),
                const HomeCategories(),
                SizedBox(
                  height: AppSizes.s15.h,
                ),
                const SubscriptionPackages(),
                SizedBox(
                  height: AppSizes.s15.h,
                ),
                const HelpList(),
                SizedBox(
                  height: AppSizes.s15.h,
                ),
                const SayAboutUs(),
                SizedBox(
                  height: AppSizes.s15.h,
                ),
                const GuaranteeYourRights(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
