
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


}