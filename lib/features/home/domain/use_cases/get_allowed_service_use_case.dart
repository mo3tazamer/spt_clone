import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/core/usecase/base_use_case.dart';


import '../../../../core/error/failures.dart';
import '../entities/service_entity/service_entity.dart';
import '../repositories/home_repo.dart';

class GetAllowedServiceUseCase extends BaseUseCase<List<ServiceEntity>, NoParams>{
  final HomeRepo homeRepo;
  GetAllowedServiceUseCase({required this.homeRepo}) ;

  @override
  Future<Result<List<ServiceEntity>, Failure>> call(NoParams params) async{
    return await homeRepo.getAllowedService();
  }
}