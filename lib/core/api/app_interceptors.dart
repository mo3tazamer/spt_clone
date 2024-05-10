import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:spt_clone/core/utils/app_constants.dart';

import '../local_storage/local_storage_consumer.dart';

class AppInterceptors extends Interceptor {
  LocalStorageConsumer localStorageConsumer;
  AppInterceptors({required this.localStorageConsumer});
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[AppConstants.contentLanguage] = AppConstants.arCode;
    options.headers[AppConstants.xRequestedWith] = AppConstants.xRequestedWith;
    options.headers[AppConstants.contentType] = AppConstants.contentType;
    options.headers[AppConstants.authorization] = localStorageConsumer.getData(
                key: AppConstants.token) !=
            null
        ? '${AppConstants.bearer} ${localStorageConsumer.getData(key: AppConstants.token)}'
        : null;
    options.connectTimeout = const Duration(seconds: 5);
    options.receiveTimeout = const Duration(seconds: 5);

    handler.next(options);
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    super.onResponse(response, handler);
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
