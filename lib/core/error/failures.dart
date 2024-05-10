import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({required String message}) : super(message: message);
}

class CachedFailure extends Failure {
  const CachedFailure({required String message}) : super(message: message);
}

class LocationFailure extends Failure {
  const LocationFailure({required String message}) : super(message: message);
}

class LocationServiceDisabledFailure extends Failure {
  const LocationServiceDisabledFailure({required String message})
      : super(message: message);
}

class LocationPermissionsDeniedFailure extends Failure {
  const LocationPermissionsDeniedFailure({required String message})
      : super(message: message);
}

class LocationPermissionsDeniedForeverFailure extends Failure {
  const LocationPermissionsDeniedForeverFailure({required String message})
      : super(message: message);
}

class GalleryFailure extends Failure {
  const GalleryFailure({required String message}) : super(message: message);
}
