import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:spt_clone/core/usecase/base_use_case.dart';
import 'package:spt_clone/features/home/domain/entities/review_entity/review_model.dart';
import '../../../../core/error/failures.dart';

import '../repositories/home_repo.dart';

final class PlatformReviewsUseCase extends BaseUseCase<List<ReviewModel>, PlatformReviewsParams> {
  final HomeRepo homeRepo;

  PlatformReviewsUseCase({required this.homeRepo});

  @override
  Future<Result<List<ReviewModel>, Failure>> call(
      PlatformReviewsParams params) async {
    return await homeRepo.getReviews(params: params);
  }
}

final class PlatformReviewsParams extends Equatable {
  final int? page;

  const PlatformReviewsParams({required this.page});
  Map<String, dynamic> queryParams() {
    return {
      'page': page,
      'paginate': 10,
    };
  }

  @override
  List<Object?> get props => [page];
}
