import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spt_clone/features/auth/data/repositories/authrepository.dart';

import 'package:spt_clone/features/auth/domain/use_cases/send_otp.dart';
import 'package:spt_clone/translations/codegen_loader.g.dart';

import 'app.dart';
import 'core/git_it/git_it.dart';
import 'core/utils/app_constants.dart';
import 'features/auth/domain/repositories/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   EasyLocalization.ensureInitialized();
  await setup();

  // var send = await SendOtpUseCase(authRepository: sL()).call(recipient: '966522222223');
  //
  // if (kDebugMode) {
  //  (send.when((l) => print('ready ${l.toString()}'), (r) => print(r.message)));
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
      saveLocale: false,
      fallbackLocale: const Locale(AppConstants.arCode),
      assetLoader: const CodegenLoader(),
      child: const SptClone()));
}
