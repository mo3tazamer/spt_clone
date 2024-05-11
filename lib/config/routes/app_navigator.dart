import 'package:flutter/material.dart' show BuildContext, Navigator, Route;
   // handle navigator
final class AppNavigator {
  AppNavigator._();

  static Future<T?> navigateNamedTo<T>(
    BuildContext context,
    String route, {
    var arguments,
    bool withNavBar = true,
  }) {
    return Navigator.of(context, rootNavigator: !withNavBar).pushNamed<T>(
      route,
      arguments: arguments,
    );
  }

  static Future<T?> navigateNamedReplacement<T>(
    BuildContext context,
    String route, {
    var arguments,
    bool withNavBar = true,
  }) {
    return Navigator.of(context, rootNavigator: !withNavBar)
        .pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  static Future<T?> navigateNamedFinish<T>(
    BuildContext context,
    String route, {
    var arguments,
    bool withNavBar = true,
  }) {
    return Navigator.of(context, rootNavigator: !withNavBar)
        .pushNamedAndRemoveUntil<T>(
      route,
      (route) => false,
      arguments: arguments,
    );
  }

  static popUntil<T>(BuildContext context, {
        var arguments,
        bool withNavBar = true,
        required bool Function(Route<dynamic>) predicate,
      }) {
    return Navigator.of(context, rootNavigator: !withNavBar).popUntil(predicate);
  }

  static void pop<T>(BuildContext context, [T? result]) =>
      Navigator.pop<T>(context, result);

  // static void navigatePushReplacementNamedTo(
  //   BuildContext context,
  //   String route, {
  //   required String predicate,
  // }) =>
  //     Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
  //       route,
  //       ModalRoute.withName(predicate),
  //     );
}
