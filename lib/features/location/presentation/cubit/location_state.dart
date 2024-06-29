part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSuccess extends LocationState {
  final Location location;
  LocationSuccess({required this.location});
}

final class LocationError extends LocationState {
  final String message;
  LocationError({required this.message});
}