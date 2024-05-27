import 'package:flutter/material.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/features/home/presentation/widgets/custom_app_bar.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_textstyles.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails({super.key});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('تفاصيل المتجر',
            style:
                AppTextStyles.style16.copyColorWith(AppColors.whiteTextColor)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

      ],),
    );
  }
}
