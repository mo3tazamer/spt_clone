import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:spt_clone/core/api/endpoints.dart';

import 'package:spt_clone/core/api/status_code.dart';

import '../error/exceptions.dart';
import '../git_it/git_it.dart';
import '../utils/app_strings.dart';
import 'api_consumer.dart';
import 'app_interceptors.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    client.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
        return client;
      },
    );
    _setupClient();
  }

  void _setupClient() {
    client.options
      ..baseUrl = ApiEndPoints.baseUrl
      ..responseType = ResponseType.json
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.notImplemented;
      };

    client.interceptors.add(sL<AppInterceptors>());
    client.interceptors.add(sL<LogInterceptor>());
  }

  @override
  Future get(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future post(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.post(path, queryParameters: queryParameters, data: body);
      return response.data;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future put(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await client.put(path, queryParameters: queryParameters, data: body);
      return response.data;
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }
}

dynamic _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw const FetchDataException(
        AppStrings.connectionTimeoutError,
      );
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case StatusCode.badRequest:
          throw BadRequestException(
            jsonEncode(error.response?.data),
          );
        case StatusCode.unauthorized:
        case StatusCode.forbidden:
          throw UnauthorizedException(
            jsonEncode(error.response?.data),
          );
        case StatusCode.notFound:
          throw NotFoundException(
            jsonEncode(error.response?.data),
          );
        case StatusCode.conflict:
          throw ConflictException(
            jsonEncode(error.response?.data),
          );
        case StatusCode.unprocessableEntity:
          throw UnProcessableEntityException(
            jsonEncode(error.response?.data),
          );
        case StatusCode.internalServerError:
          throw const InternalServerErrorException(
              AppStrings.internalServerErrorException);
        default:
          throw const FetchDataException(
            AppStrings.connectionTimeoutError,
          );
      }

    case DioExceptionType.cancel:
      break;
    case DioExceptionType.badCertificate:
      break;
    case DioExceptionType.unknown:
      throw const NoInternetException(AppStrings.noInternetConnection);
    case DioExceptionType.badCertificate:
      throw const NoInternetException(AppStrings.noInternetConnection);
    case DioExceptionType.connectionError:
      throw const NoInternetException(AppStrings.noInternetConnection);
  }
}
