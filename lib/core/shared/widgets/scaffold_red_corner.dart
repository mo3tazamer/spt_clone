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
          AppSvgImage(
            color: Colors.red,
            height: 240.h,
            width: 240.w,
            image: ImagesAssets.redCorner,
          ),
          body,
        ],
      ),
    );
  }
}
