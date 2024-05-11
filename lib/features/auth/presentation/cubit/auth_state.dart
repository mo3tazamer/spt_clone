part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class SendOtpLoading extends AuthState {}

final class SendOtpSuccess extends AuthState {}

final class SendOtpError extends AuthState {
  final Failure error;

  const SendOtpError({required this.error});
}
final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}


final class RegisterError extends AuthState {
  final Failure error;

  const RegisterError({required this.error});
}
final class VerifyOtpLoading extends AuthState {}
final class VerifyOtpSuccess extends AuthState {
  final User user;

  const VerifyOtpSuccess({required this.user});
}
final class VerifyOtpError extends AuthState {
  final Failure error;

  const VerifyOtpError({required this.error});
}





final class GetCityListLoading extends AuthState {}
final class GetCityListSuccess extends AuthState {
  final List<CityEntity> cityEntity;

  const GetCityListSuccess({required this.cityEntity});
}
final class GetCityListError extends AuthState {
  final Failure error;

  const GetCityListError({required this.error});
}