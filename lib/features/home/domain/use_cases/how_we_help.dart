import 'package:equatable/equatable.dart';
import 'package:multiple_result/src/result.dart';

import 'package:spt_clone/core/error/failures.dart';
import 'package:spt_clone/features/home/domain/repositories/home_repo.dart';

import '../../../../core/enums/static_pages_types_enum.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/how_we_help_entity/how_we_help_entity.dart';

class HowWeHelp extends BaseUseCase<HowWeHelpEntity, PagesParams> {
  HomeRepo homeRepo;
  HowWeHelp(this.homeRepo);

  @override
  Future<Result<HowWeHelpEntity, Failure>> call(PagesParams params) async {
    return await homeRepo.howWeHelp(params: params);
  }
}

class PagesParams extends Equatable {
  final StaticPagesTypesEnum staticPagesType;
  final int? page;
  final int? paginate;


  const PagesParams({
    required this.staticPagesType,
    this.page,
    this.paginate,
  });
  Map<String, dynamic>  queryParams(){
  return {
  'page': page,
  'paginate':paginate
  };
}
@override
  List<Object?> get props => [
        staticPagesType,
        page,
        paginate,
      ];
}
