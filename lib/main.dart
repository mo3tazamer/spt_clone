import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spt_clone/translations/codegen_loader.g.dart';

import 'app.dart';
import 'core/utils/app_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale(AppConstants.enCode),
        Locale(AppConstants.arCode)
      ],
      path: AppConstants.localizationPath,
      saveLocale: true,
      fallbackLocale: const Locale(AppConstants.enCode),
      assetLoader: const CodegenLoader(),
      child: const SptClone()));
}
