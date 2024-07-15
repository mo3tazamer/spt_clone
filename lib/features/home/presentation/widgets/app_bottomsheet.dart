import 'package:flutter/material.dart';

import '../../../../config/routes/app_navigator.dart';
import '../../../../config/routes/app_routes.dart';

Future<T?> sptHelp<T>({
  required BuildContext context,
}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    enableDrag: false,
    isDismissible: false,
    backgroundColor: Colors.white,
    useRootNavigator: true,
    constraints: const BoxConstraints.tightFor(
      width: double.infinity,
      height: double.infinity,
    ),
    context: context,
    builder: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('كيف يساعدك spt'),
              IconButton(
                onPressed: () {
                  AppNavigator.pop(context);
                },
                icon: const Icon(Icons.close),
              )
            ],
          )
        ],
      );
    },
  );
}
