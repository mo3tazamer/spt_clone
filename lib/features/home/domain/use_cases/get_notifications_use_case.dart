import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:spt_clone/core/usecase/base_use_case.dart';

import '../../../../core/error/failures.dart';
import '../entities/notification_entity.dart';
import '../repositories/home_repo.dart';

class GetNotificationsUseCase
    extends BaseUseCase<List<NotificationEntity>, GetNotificationsParams> {
  final HomeRepo homeRepo;
  GetNotificationsUseCase({required this.homeRepo});
  @override
  Future<Result<List<NotificationEntity>, Failure>> call(
      GetNotificationsParams params) async {
    return homeRepo.getNotification(params: params);
  }
}

class GetNotificationsParams extends Equatable {
  final int? paginate;
  const GetNotificationsParams({this.paginate});

  Map<String, dynamic> queryParams() {
    return {
      'paginate': 10,
      'page': paginate,
      // 'sort': SortingEnum.ascending.val,
      // 'sort': SortingEnum.descending.val,
    };
  }

  @override
  List<Object?> get props => [paginate];
}
