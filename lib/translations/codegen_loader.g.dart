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
  "identifyCode": "رمز التحقق",
  "pleaseEnterTheVerificationCodeSentToYourMobilePhone": "فضلا ادخل رمز التحقق المرسل إلى جوالك",
  "resendCode": "اعادة الارسال",
  "identify": "تحقق",
  "signIn": "تسجيل جديد",
  "registerNow": "سجل الان",
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
  "identifyCode": "identify Code",
  "pleaseEnterTheVerificationCodeSentToYourMobilePhone": "Please Enter The Verification Code Sent To Your Mobile Phone",
  "resendCode": "resend Code",
  "identify": "identify",
  "signIn": "sign In",
  "registerNow": "Register Now",
  "firstName": "first Name",
  "lastName": "last Name",
  "enterName": "enter Name",
  "welcome": "welcome",
  "otpMsg": "if you do not receive the code, you can resend the code within 20 seconds."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
