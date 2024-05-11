import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/core/error/exceptions.dart';
import 'package:spt_clone/features/auth/data/data_sources/web_sevices.dart';
import 'package:spt_clone/features/auth/domain/entities/city.dart';
import 'package:spt_clone/features/auth/domain/entities/user.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  WebServices webServices;
  final NetworkInfo networkInfo;

  AuthRepositoryImp({required this.webServices, required this.networkInfo});

  @override
  Future<Result<Unit, Failure>> register(
      {required String name,
      required String phone,
      required String cityId}) async {
    if (await networkInfo.isConnected) {
      try {
        await webServices.register(name: name, phone: phone, cityId: cityId);
        return const Result.success(unit);
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Result<dynamic, Failure>> sendOtp({required String recipient}) async {
    if (await networkInfo.isConnected) {
      try {
        return Result.success(await webServices.sendOtp(recipient: recipient));
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Result<User?, Failure>> verifyOtp(
      {required String recipient, required String code}) async {
    if (await networkInfo.isConnected) {
      try {
        return Result.success(
            await webServices.verifyOtp(recipient: recipient, code: code));
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Result<List<CityEntity>, Failure>> getCityList({required String param}) async {
    if (await networkInfo.isConnected) {
      try {
        return Result.success(await webServices.getCityList(param: param));
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));

    }
  }
}
