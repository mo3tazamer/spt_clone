
import 'package:flutter/material.dart';
import 'package:spt_clone/features/auth/presentation/screens/login_Screen.dart';
import 'package:spt_clone/features/auth/presentation/screens/otp_screen.dart';
import 'package:spt_clone/features/auth/presentation/screens/sign_up_screen.dart';

import 'app_routes.dart';

class AppGenerator {

  static Route<dynamic> getRoute(RouteSettings settings) {

    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
      case AppRoutes.otpScreen:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      case AppRoutes.signUpScreen:

        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}