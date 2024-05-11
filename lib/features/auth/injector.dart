import '../../core/git_it/git_it.dart';
import 'data/data_sources/web_sevices.dart';
import 'data/repositories/authrepository.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/use_cases/get_city_list.dart';
import 'domain/use_cases/register_usecase.dart';
import 'domain/use_cases/send_otp.dart';
import 'domain/use_cases/verify_otp.dart';

void auth() {
// repo

  sL.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(networkInfo: sL(), webServices: sL()));

//web services
  sL.registerLazySingleton<WebServices>(
      () => WebServicesImp(localStorageConsumer: sL(), apiConsumer: sL()));

//use case

  sL.registerLazySingleton<SendOtpUseCase>(
      () => SendOtpUseCase(authRepository: sL()));
  sL.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(authRepository: sL()));
  sL.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(authRepository: sL()));

  sL.registerLazySingleton<GetCityListUseCase>(
      () => GetCityListUseCase(authRepository: sL()));
}
