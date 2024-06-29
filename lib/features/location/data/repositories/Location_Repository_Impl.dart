import 'package:multiple_result/multiple_result.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/location.dart';
import '../../domain/repositories/Location_Repository.dart';
import '../data_sources/location_services.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;
  LocationRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Result<Location, Failure>> getCurrentLocation() async {
    try {
      final remoteLocation = await remoteDataSource.getCurrentLocation();
      return Result.success(Location(
          latitude: remoteLocation.latitude,
          longitude: remoteLocation.longitude));
    } on ServerException catch (e) {
      return Result.error(ServerFailure(message: e.message!));
    }
  }
}
