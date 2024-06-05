import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:spt_clone/core/utils/app_assets.dart';

import 'package:spt_clone/features/home/presentation/screens/home.dart';
import 'package:spt_clone/features/home/presentation/screens/store_details.dart';

import '../../../../config/routes/app_generator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/screens/notification_screen.dart';
import '../widgets/nav_bar_item.dart';

class LayOutScreen extends StatefulWidget {
  const LayOutScreen({super.key});

  @override
  State<LayOutScreen> createState() => _LayOutScreenState();
}

class _LayOutScreenState extends State<LayOutScreen> {
  List<Widget> screens = [
    /// example screens
    const HomeScreen(),
    const NotificationScreen(),
    const StoreDetails(),
    const Text('4'),
  ];

  List<PersistentBottomNavBarItem> items = [
    navBarItem(

        icon: IconAssets.home,
        label: 'الرئيسية',
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(

            onGenerateRoute: AppGenerator.getRoute)),
    navBarItem(
        icon: IconAssets.myOrder,
        label: 'طلباتي',
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            onGenerateRoute: AppGenerator.getRoute)),
    navBarItem(
        icon: IconAssets.myWallet,
        label: 'محفظتي',
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            onGenerateRoute: AppGenerator.getRoute)),
    navBarItem(
        icon: IconAssets.myServices,
        label: 'حسابي',
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            onGenerateRoute: AppGenerator.getRoute)),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(

      /// handleAndroidBackButtonPress: true,
      controller: PersistentTabController(initialIndex: 0),
      screens: screens,
      items: items,
      context,
      navBarStyle: NavBarStyle.style14,

      confineInSafeArea: true,

      backgroundColor: AppColors.scaffoldBackgroundColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: false,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}
