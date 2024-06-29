import 'package:geolocator/geolocator.dart';

import '../../domain/entities/location.dart';

class LocationModel extends Location {

  const LocationModel({
    required super.latitude,
    required super.longitude,
  });

  factory LocationModel.fromPosition(Position position) {
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }


}
