import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:spt_clone/features/auth/domain/use_cases/get_city_list.dart';

import 'package:spt_clone/translations/codegen_loader.g.dart';

import 'app.dart';
import 'core/git_it/git_it.dart';
import 'core/utils/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();
  await appInjector();

  // var send = await GetCityListUseCase(authRepository: sL()).call(param: '50');
  //
  // if (kDebugMode) {
  //  (send.when((l) => ('ready ${l.toString()}'), (r) => (r.message)));
  //
  // }

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
