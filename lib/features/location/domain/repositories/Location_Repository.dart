import 'package:geolocator/geolocator.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../entities/location.dart';

abstract class LocationRepository {
  Future<Result<Location,Failure >> getCurrentLocation() ;


}