import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_colors.dart';
import 'package:spt_clone/core/utils/sizes.dart';
import 'package:spt_clone/features/auth/presentation/widgets/svg_image.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../core/utils/app_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: AppSizes.s90.h,
      flexibleSpace: Container(
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25.0.dm),
            ),
            image: const DecorationImage(
                image: AssetImage(ImagesAssets.appBarBackground),
                fit: BoxFit.fitHeight)),
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0.sw)),
      // ),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: AppSvgImage(
        image: IconAssets.settingIcon,
        color: Colors.black,
        fit: BoxFit.scaleDown,
        height: AppSizes.s30.h,
        width: AppSizes.s30.w,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      centerTitle: true,
      title: Image.asset(ImagesAssets.appBarLogo, fit: BoxFit.scaleDown, scale:   .7.dm,),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: AppSizes.s18),

          /// handle badge
          child: badges.Badge(
            badgeContent: const Text('3'),
            child: AppSvgImage(
              image: IconAssets.iconNotification,
              color: AppColors.lightGray1,
              fit: BoxFit.contain,
              height: AppSizes.s30.h,
              width: AppSizes.s30.h,
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, AppSizes.s90.h);
}
