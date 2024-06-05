import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_strings.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../config/routes/app_navigator.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/shared/widgets/app_text_field.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/sizes.dart';
import '../../../auth/presentation/widgets/svg_image.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/guarantee_your_rights.dart';
import '../widgets/help_list.dart';
import '../widgets/home_categories.dart';
import '../widgets/home_tab.dart';
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

      appBar: _homeAppBar(context),
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
                 SizedBox(height: 200.h,
                     child: const HomeTab()),
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

CustomAppBar _homeAppBar(BuildContext context) {
  return CustomAppBar(
    automaticallyImplyLeading: false,
    leading: IconButton(
        onPressed: () {},
        icon: AppSvgImage(
          image: IconAssets.settingIcon,
          height: AppSizes.s30.h,
          width: AppSizes.s30.w,
          color: Colors.black,
        )),
    actions: [
      IconButton(
        padding: const EdgeInsets.all(15),
        onPressed: () {
          AppNavigator.navigateNamedTo(context, AppRoutes.notificationsScreen);
        },
        icon: badges.Badge(
          badgeContent: const Text('3'),
          child: AppSvgImage(
            image: IconAssets.iconNotification,
            fit: BoxFit.scaleDown,
            height: AppSizes.s30.h,
            width: AppSizes.s30.w,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
