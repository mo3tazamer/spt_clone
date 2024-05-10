import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/core/error/failures.dart';

import '../repositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository authRepository;

  SendOtpUseCase({required this.authRepository});

  Future<Result<dynamic, Failure>> call({required String recipient}) async {
    return await authRepository.sendOtp(recipient: recipient);
  }
}
