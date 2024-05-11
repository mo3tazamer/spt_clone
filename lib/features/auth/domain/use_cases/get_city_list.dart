import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/core/error/failures.dart';
import 'package:spt_clone/features/auth/domain/entities/city.dart';
import 'package:spt_clone/features/auth/domain/repositories/auth_repository.dart';

class GetCityListUseCase {
  AuthRepository authRepository;
  GetCityListUseCase({required this.authRepository});

  Future<Result<List<CityEntity>, Failure>> call({required String param}) async {

    return  authRepository.getCityList(param: param);

  }
}