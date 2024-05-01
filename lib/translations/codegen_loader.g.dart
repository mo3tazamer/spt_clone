// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "logIn": "تسجيل الدخول",
  "phoneNumber": "رقم الجوال",
  "enterPhoneNumber": "أدخل رقم الجوال",
  "resendCode": "اعادة الارسال",
  "identify": "تحقق",
  "signIn": "تسجيل جديد",
  "firstName": "الاسم الاول",
  "lastName": "الاسم الثاني",
  "enterName": "أدخل الاسم",
  "welcome": "مرحبًا ، مرحبًا بعودتك!",
  "otpMsg": "إذا لم تستلم الرمز ، يمكنك إعادة إرسال الرمز خلال 20 ثانية."
};
static const Map<String,dynamic> en = {
  "logIn": "log In",
  "phoneNumber": "phone Number",
  "enterPhoneNumber": "enter Phone Number",
  "resendCode": "resend Code",
  "identify": "identify",
  "signIn": "sign In",
  "firstName": "first Name",
  "lastName": "last Name",
  "enterName": "enter Name",
  "welcome": "welcome",
  "otpMsg": "otpMsg"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
