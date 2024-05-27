import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/sizes.dart';
import '../../../../core/shared/widgets/app_back_button.dart';
import '../../../../core/utils/app_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
  });
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: AppSizes.s90.h,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: automaticallyImplyLeading,
      //app bar background
      flexibleSpace: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25.0.dm),
            ),
            image: const DecorationImage(
                image: AssetImage(ImagesAssets.appBarBackground),
                fit: BoxFit.fitHeight)),
      ),
      //app bar logo or title
      title: title ??
          Image.asset(
            ImagesAssets.appBarLogo,
            fit: BoxFit.scaleDown,
            scale: .7.dm,
          ),
      leading: (automaticallyImplyLeading == true && leading == null)
          ? const AppBackButton()
          : leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, AppSizes.s90.h);
}
