import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spt_clone/core/error/failures.dart';
import 'package:spt_clone/features/auth/domain/entities/city.dart';
import 'package:spt_clone/features/auth/domain/entities/user.dart';

import '../../domain/use_cases/get_city_list.dart';
import '../../domain/use_cases/register_usecase.dart';
import '../../domain/use_cases/send_otp.dart';
import '../../domain/use_cases/verify_otp.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      {required this.registerUseCase,
      required this.verifyOtpUseCase,
      required this.sendOtpUseCase,
      required this.getCityListUseCase})
      : super(AuthInitial());
  RegisterUseCase registerUseCase;
  VerifyOtpUseCase verifyOtpUseCase;
  SendOtpUseCase sendOtpUseCase;
  GetCityListUseCase getCityListUseCase;
  late var phone;


  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  Future<void> sendOtp({required String recipient}) async {
    emit(SendOtpLoading());
    phone= recipient;
    var result = await sendOtpUseCase(recipient: recipient);


    result.when((success) => emit(SendOtpSuccess()),
        (error) => emit(SendOtpError(error: error)));
  }

  Future<void> register(
      {required String name,
      required String phone,
      required String cityId}) async {
    emit(RegisterLoading());
    var result =
        await registerUseCase(name: name, phone: phone, cityId: cityId);
    result.when((success) => emit(RegisterSuccess()),
        (error) => emit(RegisterError(error: error)));
  }

  Future<void> verifyOtp(
      {required String recipient, required String code}) async {
    emit(VerifyOtpLoading());
    var result = await verifyOtpUseCase(recipient: recipient, code: code);
    result.when((success) => emit(VerifyOtpSuccess(user: success!)),
        (error) => emit(VerifyOtpError(error: error)));
  }

  Future<void> getCityList({required String param}) async {
    emit(GetCityListLoading());
    var result = await getCityListUseCase(param: param);
    result.when((success) => emit(GetCityListSuccess(cityEntity: success)),
        (error) => emit(GetCityListError(error: error)));

  }
}
