import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spt_clone/features/auth/data/data_sources/web_sevices.dart';
import 'package:spt_clone/features/auth/data/repositories/authrepository.dart';
import 'package:spt_clone/features/auth/domain/repositories/auth_repository.dart';
import 'package:spt_clone/features/auth/domain/use_cases/register_usecase.dart';
import 'package:spt_clone/features/auth/domain/use_cases/send_otp.dart';
import 'package:spt_clone/features/auth/domain/use_cases/verify_otp.dart';

import '../api/api_consumer.dart';
import '../api/app_interceptors.dart';
import '../api/dio_consumer.dart';
import '../local_storage/local_storage_consumer.dart';
import '../local_storage/shared_pref_consumer.dart';
import '../network/network_info.dart';

final sL = GetIt.instance;

Future<void> setup()  async{
  //sharedpref LocalStorageConsumer
  sL.registerLazySingleton<LocalStorageConsumer>(
      () => SharedPrefConsumer(sharedPreferences: sL()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sL.registerLazySingleton(() => sharedPreferences);

  // ApiConsumer
  sL.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sL()));
  sL.registerLazySingleton(() => Dio());

  // AppInterceptors
  sL.registerLazySingleton(
      () => AppInterceptors(localStorageConsumer: sL()));
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

  // repo

  sL.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(networkInfo: sL(), webServices: sL()));

  //web services
  sL.registerLazySingleton<WebServices>(
      () => WebServicesImp(localStorageConsumer: sL(), apiConsumer:  sL()));

  //use case

  sL.registerLazySingleton<SendOtpUseCase>(
      () => SendOtpUseCase(authRepository: sL()));
  sL.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(authRepository: sL()));
  sL.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(authRepository: sL()));





}
