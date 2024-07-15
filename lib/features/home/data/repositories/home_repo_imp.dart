import 'package:multiple_result/src/result.dart';
import 'package:spt_clone/core/error/exceptions.dart';

import 'package:spt_clone/core/error/failures.dart';
import 'package:spt_clone/core/network/network_info.dart';

import 'package:spt_clone/features/home/domain/entities/how_we_help_entity/how_we_help_entity.dart';

import 'package:spt_clone/features/home/domain/entities/notification_entity.dart';

import 'package:spt_clone/features/home/domain/entities/review_entity/review_model.dart';

import 'package:spt_clone/features/home/domain/entities/service_entity/service_entity.dart';

import 'package:spt_clone/features/home/domain/use_cases/client_review_use_case.dart';

import 'package:spt_clone/features/home/domain/use_cases/get_notifications_use_case.dart';

import 'package:spt_clone/features/home/domain/use_cases/how_we_help.dart';

import 'package:spt_clone/features/home/domain/use_cases/make_notification_read_use_case.dart';

import '../../../../core/utils/app_strings.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/web_sevices.dart';

class HomeRepoImp extends HomeRepo {
  NetworkInfo networkInfo;
  HomeRemoteDataSource remoteDataSource;

  HomeRepoImp({required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Result<List<ServiceEntity>, Failure>> getAllowedService() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getAllowedService();
        return Result.success(result);
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Result<List<NotificationEntity>, Failure>> getNotification(
      {required GetNotificationsParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getNotifications(params: params);
        return Result.success(result);
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Result<List<ReviewModel>, Failure>> getReviews(
      {required PlatformReviewsParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getReviews(params: params);
        return Result.success(result);
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Result<int, Failure>> getUnReadNotification() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getUnReadNotifications();
        return Result.success(result);
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Result<HowWeHelpEntity, Failure>> howWeHelp(
      {required PagesParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.howWeHelp(params: params);
        return Result.success(result);
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));
    }
  }

  @override
  Future<Result<void, Failure>> makeNotificationAsRead(
      {required MakeNotificationAsReadParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await remoteDataSource.makeNotificationAsRead(params: params);
        return Result.success(result);
      } on ServerException catch (e) {
        return Result.error(ServerFailure(message: e.message!));
      }
    } else {
      return const Result.error(
          NetworkFailure(message: AppStrings.noInternetConnection));
    }
  }
}
