part of 'location_cubit.dart';

abstract class LocationState extends Equatable {}

final class LocationInitial extends LocationState {
  @override
  List<Object?> get props => [];
}

final class LocationLoading extends LocationState {
  @override
  List<Object?> get props => [];
}

final class LocationSuccess extends LocationState {
  final Location location;
  LocationSuccess({required this.location});

  @override
  List<Object?> get props => [location];
}

final class LocationError extends LocationState {
  final String message;
  LocationError({required this.message});

  @override
  List<Object?> get props => [message];
}
