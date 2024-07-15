import 'package:flutter/material.dart';
import 'package:spt_clone/features/auth/presentation/screens/login_Screen.dart';
import 'package:spt_clone/features/auth/presentation/screens/otp_screen.dart';
import 'package:spt_clone/features/auth/presentation/screens/sign_up_screen.dart';

import '../../features/home/presentation/screens/notification_screen.dart';
import '../../features/home/presentation/screens/says_about_us_screen.dart';
import '../../features/home/presentation/screens/store_details.dart';
import '../../features/layout/presentation/screens/layout_screen.dart';
import '../../features/search/presentation/screens/search_view.dart';

import '../../features/splash/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class AppGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
      case AppRoutes.otpScreen:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case AppRoutes.sayAboutUsScreen:
        return MaterialPageRoute(
            builder: (context) => const SayAboutUsScreen());
      case AppRoutes.layoutScreen:
        return MaterialPageRoute(builder: (context) => const LayOutScreen());
      case AppRoutes.notificationsScreen:
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());

      case AppRoutes.storeDetails:
        return MaterialPageRoute(builder: (context) => const StoreDetails());
      case AppRoutes.searchScreen:
        return MaterialPageRoute(builder: (context) => const SearchView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
