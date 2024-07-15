import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/config/theme/theme.dart';
import 'package:spt_clone/core/git_it/git_it.dart';
import 'package:spt_clone/features/auth/presentation/cubit/auth_cubit.dart';

import 'config/routes/app_generator.dart';

import 'features/layout/presentation/screens/layout_screen.dart';

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
                  final mediaQueryData = MediaQuery.of(context);
                  final scale = mediaQueryData.textScaler.clamp(
                    minScaleFactor: 1.0,
                    maxScaleFactor: 1.3,
                  );
                  return MediaQuery(
                    //Setting font does not change with system font size
                    data: MediaQuery.of(context).copyWith(textScaler: scale),
                    child: child!,
                  );
                },
              ),
              home: const LayOutScreen(),
            );
          }),
    );
  }
}
