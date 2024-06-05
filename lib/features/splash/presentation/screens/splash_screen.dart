import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spt_clone/core/git_it/git_it.dart';
import 'package:spt_clone/core/shared/widgets/scaffold_red_corner.dart';
import 'package:spt_clone/core/utils/app_assets.dart';
import 'package:spt_clone/features/auth/presentation/screens/login_Screen.dart';
import 'package:spt_clone/features/home/presentation/screens/home.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../layout/presentation/screens/layout_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldRedCorner(
      body: AnimatedSplashScreen(
          splash: ImagesAssets.splash,
          duration: 5,
          splashIconSize: 200.h,
          centered: true,
          splashTransition: SplashTransition.sizeTransition,
          backgroundColor: Colors.white,
          nextScreen: _nextScreen()),
    );
  }
}

Widget _nextScreen() {
  if (sL<SharedPreferences>().getString(AppConstants.token) != null) {
    return const LayOutScreen();
  } else {
    return const LogInScreen();
  }
}
