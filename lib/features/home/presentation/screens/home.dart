import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_strings.dart';

import '../../../../core/shared/widgets/app_text_field.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
               AppTextField(
                borderSize: 18.dm,
                hintText: AppStrings.search.tr(),
                 prefixIcon: Icon(
                  Icons.search,
                  size: 25.dm,
                 )

              )
            ],
          ),
        ),
      ),
    );
  }
}
