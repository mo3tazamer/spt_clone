import 'package:equatable/equatable.dart';

sealed class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$message';
}

final class FetchDataException extends ServerException {
  const FetchDataException([message]) : super(message);
}

final class BadRequestException extends ServerException {
  const BadRequestException(super.message);
}

final class UnauthorizedException extends ServerException {
  const UnauthorizedException(super.message);
}

final class NotFoundException extends ServerException {
  const NotFoundException(super.message);
}

final class ForbiddenException extends ServerException {
  const ForbiddenException(super.message);
}

final class ConflictException extends ServerException {
  const ConflictException(super.message);
}

final class UnProcessableEntityException extends ServerException {
  const UnProcessableEntityException(super.message);
}

final class InternalServerErrorException extends ServerException {
  const InternalServerErrorException(super.message);
}

final class NoInternetException extends ServerException {
  const NoInternetException(super.message);
}

class CacheException implements Exception {
  final String? message;

  const CacheException({this.message});

  @override
  String toString() => '$message';
}

sealed class LocationBaseException extends Equatable implements Exception {
  final String? message;
  const LocationBaseException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => '$message';
}

final class LocationException extends LocationBaseException {
  const LocationException([message]) : super(message);
}

final class LocationServiceDisabledException extends LocationBaseException {
  const LocationServiceDisabledException()
      : super(
          'AppStrings.locationServiceDisabledMessage.trans()',
        );
}

final class LocationPermissionsDeniedException extends LocationBaseException {
  const LocationPermissionsDeniedException()
      : super(
          'AppStrings.locationPermissionsDenied.trans()',
        );
}

final class LocationPermissionsDeniedForeverException
    extends LocationBaseException {
  const LocationPermissionsDeniedForeverException()
      : super(
          'AppStrings.locationPermissionsDeniedForever.trans()',
        );
}
// import 'package:equatable/equatable.dart';

// class ServerException extends Equatable implements Exception {
//   final String? message;

//   const ServerException([this.message]);

//   @override
//   List<Object?> get props => [message];

//   @override
//   String toString() => '$message';
// }

// class FetchDataException extends ServerException {
//   const FetchDataException([message]) : super(message);
// }

// class BadRequestException extends ServerException {
//   const BadRequestException([message]) : super(message);
// }

// class UnauthorizedException extends ServerException {
//   const UnauthorizedException([message]) : super(message);
// }

// class NotFoundException extends ServerException {
//   const NotFoundException([message]) : super(message);
// }

// class ForbiddenException extends ServerException {
//   const ForbiddenException([message]) : super('Forbidden');
// }

// class ConflictException extends ServerException {
//   const ConflictException([message]) : super('Conflict');
// }

// class UnProcessableEntityException extends ServerException {
//   const UnProcessableEntityException([message]) : super(message);
// }

// class InternalServerErrorException extends ServerException {
//   InternalServerErrorException([message])
//       : super('AppStrings.internalServerError.trans()');
// }

// class NoInternetException extends ServerException {
//   const NoInternetException([message]) : super(message);
// }

// class CacheException implements Exception {
//   final String? message;

//   const CacheException({this.message});

//   @override
//   String toString() => '$message';
// }

// sealed class LocationBaseException extends Equatable implements Exception {
//   final String? message;
//   const LocationBaseException([this.message]);

//   @override
//   List<Object?> get props => [message];

//   @override
//   String toString() => '$message';
// }

// final class LocationException extends LocationBaseException {
//   const LocationException([message]) : super(message);
// }

// final class LocationServiceDisabledException extends LocationBaseException {
//   LocationServiceDisabledException()
//       : super(
//           'AppStrings.locationServiceDisabledMessage.trans()',
//         );
// }

// final class LocationPermissionsDeniedException extends LocationBaseException {
//   LocationPermissionsDeniedException()
//       : super(
//           'AppStrings.locationPermissionsDenied.trans()',
//         );
// }

// final class LocationPermissionsDeniedForeverException
//     extends LocationBaseException {
//   LocationPermissionsDeniedForeverException()
//       : super(
//           'AppStrings.locationPermissionsDeniedForever.trans()',
//         );
// }
