import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/core/error/failures.dart';

import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<Result<void , Failure>> call(
      {required String name,
      required String phone,
      required String cityId}) async {
    return await authRepository.register(
        name: name, phone: phone, cityId: cityId);
  }
}
