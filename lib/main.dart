import 'package:easy_localization/easy_localization.dart';


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


import 'package:spt_clone/translations/codegen_loader.g.dart';

import 'app.dart';
import 'core/git_it/git_it.dart';
import 'core/utils/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();
  EasyLoading.init();
  await appInjector();



  runApp(EasyLocalization(
      supportedLocales: const [
        Locale(AppConstants.enCode),
        Locale(AppConstants.arCode)
      ],
      path: AppConstants.localizationPath,
      startLocale: const Locale(AppConstants.arCode),
      useOnlyLangCode: false,
      saveLocale: true,
      fallbackLocale: const Locale(AppConstants.arCode),
      assetLoader: const CodegenLoader(),
      child: const SptClone()));
}
