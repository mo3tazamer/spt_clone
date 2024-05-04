import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/auth/presentation/widgets/svg_image.dart';
import '../../utils/app_assets.dart';

class ScaffoldRedCorner extends StatelessWidget {
  const ScaffoldRedCorner({super.key, this.appBar, required this.body});
  final PreferredSizeWidget? appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBar,
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
              child: AppSvgImage(
                color: Colors.red,
              height: 200.h,
              width: 200.w,

            image: ImagesAssets.redCorner,
          )),
          body,
        ],
      ),
    );
  }
}
