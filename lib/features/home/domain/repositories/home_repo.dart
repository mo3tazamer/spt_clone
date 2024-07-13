import 'package:multiple_result/multiple_result.dart';
import 'package:spt_clone/features/home/domain/entities/how_we_help_entity/how_we_help_entity.dart';
import 'package:spt_clone/features/home/domain/entities/review_entity/review_model.dart';
import 'package:spt_clone/features/home/domain/entities/service_entity/service_entity.dart';

import '../../../../core/error/failures.dart';
import '../entities/notification_entity.dart';
import '../use_cases/client_review_use_case.dart';
import '../use_cases/get_notifications_use_case.dart';
import '../use_cases/how_we_help.dart';
import '../use_cases/make_notification_read_use_case.dart';

abstract class HomeRepo {
  Future<Result<List<NotificationEntity>, Failure>> getNotification(
      {required GetNotificationsParams params});
  Future<Result<int, Failure>> getUnReadNotification();
  Future<Result<void, Failure>> makeNotificationAsRead(
      {required MakeNotificationAsReadParams params});
  Future<Result<HowWeHelpEntity, Failure>> howWeHelp(
      {required PagesParams params});
  Future<Result<List<ServiceEntity>, Failure>> getAllowedService();
  Future<Result<List<ReviewModel>, Failure>> getReviews(
      {required PlatformReviewsParams params});
}
