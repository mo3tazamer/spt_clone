import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_textstyles.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 327.w,
      child: SearchAnchor(
        viewConstraints: BoxConstraints.tightFor(width: 327.w, height: 60.h),
        headerHintStyle: AppTextStyles.style14gray,
        viewHintText: AppStrings.search.tr(),
        headerHeight: 60.h,
        headerTextStyle: AppTextStyles.style14gray,
        isFullScreen: true,
        dividerColor: Colors.red,
        searchController: SearchController(),
        viewBuilder: (suggestions) => ListView(
          physics: const BouncingScrollPhysics(),
          children: suggestions.toList(),
        ),
        builder: (context, controller) => AppTextField(
          constraints: BoxConstraints.tightFor(width: 327.w, height: 60.h),
          borderSize: 18.dm,
          hintText: AppStrings.search.tr(),
          onTap: () {
            controller.openView();
          },
          prefixIcon: Icon(
            Icons.search,
            size: 25.dm,
          ),
        ),
        suggestionsBuilder: (context, controller) {
          return [];
        },
      ),
    );
  }
}
