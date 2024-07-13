import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/core/usecase/base_use_case.dart';


import '../../../../core/error/failures.dart';
import '../repositories/home_repo.dart';

class GetUnReadNotificationUseCase extends BaseUseCase<dynamic, NoParams>{

  final HomeRepo homeRepo;
  GetUnReadNotificationUseCase({required this.homeRepo});

  @override
  Future<Result<dynamic, Failure>> call(NoParams params) async{
    return await homeRepo.getUnReadNotification();
  }

}