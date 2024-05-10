import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../features/auth/injector.dart';
import '../api/api_consumer.dart';
import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';
import '../local_storage/local_storage_consumer.dart';
import '../local_storage/shared_pref_consumer.dart';
import '../network/network_info.dart';

final sL = GetIt.instance;

Future<void> appInjector() async {
  //auth
  auth();

  //sharedpref LocalStorageConsumer
  sL.registerLazySingleton<LocalStorageConsumer>(
      () => SharedPrefConsumer(sharedPreferences: sL()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sL.registerLazySingleton(() => sharedPreferences);

  // ApiConsumer
  sL.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sL()));
  sL.registerLazySingleton(() => Dio());

  // AppInterceptors
  sL.registerLazySingleton(() => AppInterceptors(localStorageConsumer: sL()));
  sL.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        requestHeader: true,
        error: true,
        logPrint: (object) => log(object.toString()),
      ));

  // InternetConnectionChecker
  sL.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sL()));
  sL.registerLazySingleton(() => InternetConnectionChecker());
}
