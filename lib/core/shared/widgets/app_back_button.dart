import 'package:flutter/material.dart';

import '../../../config/routes/app_navigator.dart';
import '../../utils/sizes.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        AppNavigator.pop(context);
      },
      // constraints: const BoxConstraints.tightFor(
      //   width: 40,
      //   height: 40,
      // ),
      shape: const CircleBorder(),
      child: const Icon(
        Icons.arrow_back_ios_rounded,
        color: Colors.white,
        size: AppSizes.s25,
      ),
    );
  }
}
