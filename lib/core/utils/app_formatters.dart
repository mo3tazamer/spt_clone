import 'package:flutter/services.dart';

class AppInputFormatters {
  static final nonArabicAndEnglishNumbersFilter =
      FilteringTextInputFormatter.deny(
    RegExp(r'[\u0660-\u0669-\u06FF0-9]'),
  );

  static final noSpecialCharsFilter = FilteringTextInputFormatter.deny(
    RegExp(r'[!@#$%^&*(),.?":{}|<>/+;-]'), // Deny special characters
  );
  static final denyArabicNumbers = FilteringTextInputFormatter.deny(
    RegExp(r'[٠١٢٣٤٥٦٧٨٩]'), // Deny special characters
  );

  static final nonArabicAndEnglishLetterAndNumbersFilter =
      FilteringTextInputFormatter.deny(
    RegExp(r'[a-zA-Z\u0600-\u06FF\u0750-\u077F\uFB50-\uFDFF\uFE70-\uFEFF]'),
  );
  static lengthLimitingTextInputFormatter(maxLength) =>
      LengthLimitingTextInputFormatter(maxLength);
  static final denySpace = FilteringTextInputFormatter.deny(' ');
}
