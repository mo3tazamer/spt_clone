import 'package:multiple_result/multiple_result.dart';

import 'package:spt_clone/core/error/failures.dart';

import '../entities/location.dart';
import '../repositories/Location_Repository.dart';

class GetLocationUseCase {
  final LocationRepository locationRepository;

  GetLocationUseCase({required this.locationRepository});

  Future<Result<Location, Failure>> call() async {
    return await locationRepository.getCurrentLocation();
  }
}
