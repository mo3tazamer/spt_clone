import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:spt_clone/core/utils/sizes.dart';

class AppSvgImage extends StatelessWidget {
  const AppSvgImage(
      {super.key,
      this.color,
      this.height = AppSizes.s24,
      this.width = AppSizes.s24,
      required this.image,
      this.fit = BoxFit.contain});
  final String image;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? fit ;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      colorFilter:color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      fit: fit!,
      height: height,
      width: width,
    );
  }
}
