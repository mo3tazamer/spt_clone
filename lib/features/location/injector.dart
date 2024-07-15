import 'package:get_it/get_it.dart';
import 'package:spt_clone/features/location/presentation/cubit/location_cubit.dart';

import '../../core/git_it/git_it.dart';
import 'data/data_sources/location_services.dart';
import 'data/repositories/Location_Repository_Impl.dart';
import 'domain/repositories/Location_Repository.dart';
import 'domain/use_cases/get_location.dart';

void initLocation() {
  //cubit
  sL.registerFactory<LocationCubit>(() => LocationCubit(sL()));
  // data
  sL.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(),
  );
  // domain
  sL.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(remoteDataSource: sL()),
  );

  // Use cases
  sL.registerLazySingleton<GetLocationUseCase>(
    () => GetLocationUseCase(locationRepository: sL()),
  );
}
