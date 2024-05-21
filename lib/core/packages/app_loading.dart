import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../utils/app_strings.dart';

Future<void> appLoading ({
  required LoadingType loadingType,
  String? loadingText,
  EasyLoadingMaskType? maskType = EasyLoadingMaskType.black,
  bool? dismissOnTap,
  Widget? customIndicator,
  Duration? duration,
}) async {
  switch (loadingType) {
    case LoadingType.loading:
      await EasyLoading.show(

        status: loadingText ?? AppStrings.loading,
        maskType: maskType,
        dismissOnTap: dismissOnTap,
        indicator: customIndicator,
      );
      break;
    case LoadingType.error:
      await EasyLoading.showError(
        loadingText ?? AppStrings.somethingWentWrong,
        maskType: maskType,
        dismissOnTap: dismissOnTap,
        duration: duration,

      );
      break;
    case LoadingType.success:
      await EasyLoading.showSuccess(
        loadingText ?? AppStrings.success,
        maskType: maskType,
        dismissOnTap: dismissOnTap,
        duration: duration,
      );
      break;
    case LoadingType.dismiss:
      await EasyLoading.dismiss(

      );
      break;
  }
}

enum LoadingType { loading, error, success, dismiss }
