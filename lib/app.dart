import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/config/theme/theme.dart';
import 'package:spt_clone/core/git_it/git_it.dart';
import 'package:spt_clone/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:spt_clone/features/home/presentation/screens/home.dart';

import 'config/routes/app_generator.dart';
import 'features/home/presentation/screens/notification_screen.dart';
import 'features/home/presentation/screens/says_about_us_screen.dart';
import 'features/home/presentation/screens/store_details.dart';



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
              builder: EasyLoading.init(
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1)),
                    child: child!,
                  );
                },
              ),
              home: const NotificationScreen(),
            );
          }),
    );
  }
}
