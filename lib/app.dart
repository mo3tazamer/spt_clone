import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/config/theme/theme.dart';
import 'package:spt_clone/core/git_it/git_it.dart';
import 'package:spt_clone/features/auth/presentation/cubit/auth_cubit.dart';

import 'config/routes/app_generator.dart';
import 'features/auth/presentation/screens/sign_up_screen.dart';

class SptClone extends StatelessWidget {
  const SptClone({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sL<AuthCubit>(),
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              onGenerateRoute: AppGenerator.getRoute,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: AppTheme.themeData,
              home: const SignUpScreen(),
            );
          }),
    );
  }
}
