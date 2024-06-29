import 'package:geolocator/geolocator.dart';

import '../models/location_model.dart';

// abstract class LocationRemoteDataSource {
//   Future<Position> getCurrentLocation();
// }
//
// class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
//   @override
//   Future<Position> getCurrentLocation() async {
//     if (!await _isLocationServiceEnabled()) {
//       throw Exception('Location services are disabled.');
//     }
//
//     if (!await _checkPermission()) {
//       throw Exception('Location permissions are denied');
//     }
//
//     return await Geolocator.getCurrentPosition();
//   }
//
//   Future<bool> _isLocationServiceEnabled() async {
//     return await Geolocator.isLocationServiceEnabled();
//   }
//
//   Future<bool> _checkPermission() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//
//     return permission != LocationPermission.denied &&
//         permission != LocationPermission.deniedForever;
//   }
// }

abstract class LocationRemoteDataSource {
  Future<LocationModel> getCurrentLocation();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<LocationModel> getCurrentLocation() async {
    if (!await _isLocationServiceEnabled()) {
      throw Exception('Location services are disabled.');
    }

    if (!await _checkPermission()) {
      throw Exception('Location permissions are denied');
    }

    final position = await Geolocator.getCurrentPosition();
    return LocationModel.fromPosition(position);
  }

  Future<bool> _isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<bool> _checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }
}
