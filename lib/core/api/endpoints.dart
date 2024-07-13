import '../enums/static_pages_types_enum.dart';

class ApiEndPoints {
  ApiEndPoints._();
  static const String baseUrl = 'https://api.spt.sa/api/v1/';
  // Auth
  static const String register = 'shared/auth/register';
  static const String sendOtp = 'shared/auth/send-otp';
  static const String verifyOtp = 'shared/auth/verify-otp';
  static const String logout = 'shared/auth/logout';
  static const String updateSettings = 'shared/auth/update-settings';
  static const String userSettings = 'shared/auth/me';
  static const String getCityList = 'cities';
  static const String getNotifications = 'notification/index';
  static const String getUnReadNotifications = 'notification/unread_count';
  static const String makeNotificationUnRead = 'notification/mark_as_read';
  static const String allowedService = 'client/services';
  static const String platformReviews = 'platform-reviews';
  static String pages(StaticPagesTypesEnum type) =>
      'pages/${type.pathEndpoint}';
}
