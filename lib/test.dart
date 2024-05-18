import 'package:flutter/material.dart';

import 'core/packages/app_loading.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
      onPressed: () {
        appLoading(
            loadingType: LoadingType.success,
            dismissOnTap: false,
            duration: const Duration(seconds: 3),
            loadingText: '...loading...');
      },
      child: const Text('loading'),
    )));
  }
}
