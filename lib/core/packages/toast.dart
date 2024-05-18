import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowMessageToast {
  static Future<bool?> setMessage({
    required String message,
    required ToastType type,
  }) async {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: type == ToastType.success ? Colors.grey : Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

enum ToastType {
  success,
  error,
}
