import 'package:spt_clone/core/utils/app_constants.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/endpoints.dart';

import '../../../../core/local_storage/local_storage_consumer.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/user.dart';

abstract class WebServices {
  Future<void> register(
      {required String name, required String phone, required String cityId});
  Future<dynamic> sendOtp({required String recipient});
  Future<User?> verifyOtp({required String recipient, required String code});
  Future<List<CityEntity>> getCityList({required String param});
}

class WebServicesImp implements WebServices {
  final ApiConsumer apiConsumer;
  final LocalStorageConsumer localStorageConsumer;
  WebServicesImp(
      {required this.localStorageConsumer, required this.apiConsumer});

  @override
  Future<void> register(
      {required String name,
      required String phone,
      required String cityId}) async {
    final response = await apiConsumer.post(
        path: ApiEndPoints.register,
        queryParameters: {'name': name, 'phone': phone, 'city_id': cityId});
    return response;
  }

  @override
  Future<dynamic> sendOtp({required String recipient}) async {
    final response = await apiConsumer.post(
        path: ApiEndPoints.sendOtp, queryParameters: {'recipient': recipient});
    return response;
  }

  @override
  Future<User?> verifyOtp(
      {required String recipient, required String code}) async {
    final response = await apiConsumer.post(
        path: ApiEndPoints.verifyOtp,
        queryParameters: {'recipient': recipient, 'city_id': code});

    await localStorageConsumer.saveData(
        key: AppConstants.token, value: response.data.token);
    return User.fromJson(response['data']);
  }

  @override
  Future<List<CityEntity>> getCityList({required String param}) async {
    final response = await apiConsumer.get(
      path: ApiEndPoints.getCityList,
      queryParameters: {'paginate': param},
    );

    return (response['data']['data'] as List)
        .map((e) => CityEntity.fromJson(e))
        .toList();
  }
}
