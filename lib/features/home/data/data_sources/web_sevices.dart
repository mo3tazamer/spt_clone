import 'package:spt_clone/core/api/api_consumer.dart';
import 'package:spt_clone/features/home/domain/entities/review_entity/review_model.dart';

import '../../../../core/api/endpoints.dart';
import '../../domain/entities/how_we_help_entity/how_we_help_entity.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/entities/service_entity/service_entity.dart';
import '../../domain/use_cases/client_review_use_case.dart';
import '../../domain/use_cases/get_notifications_use_case.dart';
import '../../domain/use_cases/how_we_help.dart';
import '../../domain/use_cases/make_notification_read_use_case.dart';

abstract class HomeRemoteDataSource {
  Future<List<NotificationEntity>> getNotifications(
      {required GetNotificationsParams params});
  Future<int> getUnReadNotifications();
  Future<void> makeNotificationAsRead(
      {required MakeNotificationAsReadParams params});
  Future<HowWeHelpEntity> howWeHelp({required PagesParams params});
  Future<List<ServiceEntity>> getAllowedService();
  Future<List<ReviewModel>> getReviews({required PlatformReviewsParams params});
}

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  ApiConsumer apiConsumer;
  HomeRemoteDataSourceImp({required this.apiConsumer});

  @override
  Future<List<ServiceEntity>> getAllowedService() async {
    final response = await apiConsumer.get(
      path: ApiEndPoints.allowedService,
    );
    return (response['data']['data'] as List)
        .map((e) => ServiceEntity.fromJson(e))
        .toList();
  }

  @override
  Future<List<NotificationEntity>> getNotifications(
      {required GetNotificationsParams params}) async {
    final response = await apiConsumer.get(
        path: ApiEndPoints.getNotifications,
        queryParameters: params.queryParams());
    return (response['data']['data'] as List)
        .map((e) => NotificationEntity.fromJson(e))
        .toList();
  }

  @override
  Future<List<ReviewModel>> getReviews(
      {required PlatformReviewsParams params}) async {
    final response = await apiConsumer.get(
        path: ApiEndPoints.platformReviews,
        queryParameters: params.queryParams());
    return (response['data']['data'] as List)
        .map((e) => ReviewModel.fromJson(e))
        .toList();
  }

  @override
  Future<int> getUnReadNotifications() async {
    final response =
        await apiConsumer.get(path: ApiEndPoints.getUnReadNotifications);
    return response;
  }

  @override
  Future<HowWeHelpEntity> howWeHelp({required PagesParams params}) async {
    final response =
        await apiConsumer.get(path: ApiEndPoints.pages(params.staticPagesType));
    return HowWeHelpEntity.fromJson(response['data']);
  }

  @override
  Future<void> makeNotificationAsRead(
      {required MakeNotificationAsReadParams params}) async {
    return await apiConsumer.put(
        path: ApiEndPoints.makeNotificationUnRead,
        queryParameters: params.body());
  }
}
