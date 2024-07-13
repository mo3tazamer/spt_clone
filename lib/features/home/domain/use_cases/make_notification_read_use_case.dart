import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/core/usecase/base_use_case.dart';

import '../../../../core/error/failures.dart';
import '../repositories/home_repo.dart';

class MakeNotificationAsReadUseCase
    extends BaseUseCase<dynamic, MakeNotificationAsReadParams> {
  final HomeRepo homeRepo;
  MakeNotificationAsReadUseCase({required this.homeRepo});
  @override
  Future<Result<dynamic, Failure>> call(
      MakeNotificationAsReadParams params) async {
    return homeRepo.makeNotificationAsRead(params: params);
  }
}

class MakeNotificationAsReadParams extends Equatable {
  final List<String>? notificationsIds;
  const MakeNotificationAsReadParams({required this.notificationsIds});

  Map<String, dynamic> body() {
    return {
      'notification_ids': notificationsIds,
    };
  }

  @override
  List<Object?> get props => [notificationsIds];
}
