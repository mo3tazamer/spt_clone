import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/core/error/failures.dart';

import '../entities/city.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Result<void, Failure>> register(
      {required String name, required String phone, required String cityId});
  Future<Result<dynamic, Failure>> sendOtp({required String recipient});
  Future<Result<User?, Failure>> verifyOtp(
      {required String recipient, required String code});
  Future<Result<List<CityEntity>, Failure>> getCityList(
      {required String param});
}
