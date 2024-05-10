import 'dart:convert';



import '../utils/app_strings.dart';
import 'failures.dart';

final class FailureHandler {
  static String getString(Failure failure) {
    if (failure is ServerFailure) {
      late Map<String, dynamic> errorResponse;
      try {
        errorResponse = jsonDecode(failure.message);
        if (errorResponse.containsKey('message')) {
          return errorResponse['message'];
        } else if (errorResponse.containsKey('Message')) {
          return errorResponse['Message'];
        }
      } catch (e) {
        return failure.message;
      }
    } else if (failure is CachedFailure) {
      return failure.message;
    } else if (failure is NetworkFailure) {
      return failure.message;
    } else if (failure is LocationFailure) {
      return failure.message;
    }
    return AppStrings.somethingWentWrong;
  }
}
