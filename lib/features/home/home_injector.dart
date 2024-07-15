import '../../core/git_it/git_it.dart';
import '../../core/network/network_info.dart';
import '../auth/data/repositories/authrepository.dart';
import '../auth/domain/repositories/auth_repository.dart';
import 'data/data_sources/web_sevices.dart';
import 'data/repositories/home_repo_imp.dart';
import 'domain/repositories/home_repo.dart';
import 'domain/use_cases/client_review_use_case.dart';
import 'domain/use_cases/get_allowed_service_use_case.dart';
import 'domain/use_cases/get_notifications_use_case.dart';
import 'domain/use_cases/get_unread_notification_use_case.dart';
import 'domain/use_cases/how_we_help.dart';
import 'domain/use_cases/make_notification_read_use_case.dart';

void homeInjector() {
  // data
  sL.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImp(apiConsumer: sL()));
  //repo
  sL.registerLazySingleton<HomeRepo>(() => HomeRepoImp(
      remoteDataSource: sL<HomeRemoteDataSource>(),
      networkInfo: sL<NetworkInfo>()));

  // usecase

  sL.registerLazySingleton<PlatformReviewsUseCase>(
      () => PlatformReviewsUseCase(homeRepo: sL<HomeRepo>()));
  sL.registerLazySingleton<GetAllowedServiceUseCase>(
      () => GetAllowedServiceUseCase(homeRepo: sL<HomeRepo>()));
  sL.registerLazySingleton<GetNotificationsUseCase>(
      () => GetNotificationsUseCase(homeRepo: sL<HomeRepo>()));
  sL.registerLazySingleton<GetUnReadNotificationUseCase>(
      () => GetUnReadNotificationUseCase(homeRepo: sL<HomeRepo>()));
  sL.registerLazySingleton<HowWeHelp>(
      () => HowWeHelp(homeRepo: sL<HomeRepo>()));
  sL.registerLazySingleton<MakeNotificationAsReadUseCase>(
      () => MakeNotificationAsReadUseCase(homeRepo: sL<HomeRepo>()));
}
