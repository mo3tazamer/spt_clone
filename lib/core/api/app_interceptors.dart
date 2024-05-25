import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import '../local_storage/local_storage_consumer.dart';
import '../utils/app_constants.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors({required this.localStorageConsumer});

  final LocalStorageConsumer localStorageConsumer;

  // String? getCurrentLang() {
  //   return sL<SharedPreferences>().getString(AppConstants.acceptLanguage);
  // }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
      ..headers[AppConstants.authorization] = localStorageConsumer.getData(
                  key: AppConstants.token) !=
              null
          ? '${AppConstants.bearer} ${localStorageConsumer.getData(key: AppConstants.token)}'
          : null
      ..headers[AppConstants.contentLanguage] = AppConstants.arCode
      ..headers[AppConstants.xRequestedWith] = AppConstants.xMLHttpRequest
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }
    super.onError(err, handler);
  }
}
