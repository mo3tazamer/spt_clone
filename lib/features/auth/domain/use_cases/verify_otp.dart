import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/features/auth/domain/entities/user.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class VerifyOtpUseCase{
  final AuthRepository authRepository ;

  VerifyOtpUseCase({required this.authRepository});
  Future<Result<User?, Failure>> call({required String recipient,required String code })async{

    return await authRepository.verifyOtp(recipient: recipient, code: code);
  }

}