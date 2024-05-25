import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

class CachedFailure extends Failure {
  const CachedFailure({required super.message});
}

class LocationFailure extends Failure {
  const LocationFailure({required super.message});
}

class LocationServiceDisabledFailure extends Failure {
  const LocationServiceDisabledFailure({required super.message});
}

class LocationPermissionsDeniedFailure extends Failure {
  const LocationPermissionsDeniedFailure({required super.message});
}

class LocationPermissionsDeniedForeverFailure extends Failure {
  const LocationPermissionsDeniedForeverFailure({required super.message});
}

class GalleryFailure extends Failure {
  const GalleryFailure({required super.message});
}
