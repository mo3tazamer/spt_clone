import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../config/routes/app_navigator.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/utils/app_strings.dart';


class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  SearchController? searchController = SearchController();
  @override
  void dispose() {
    searchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      readOnly: true,
      constraints: BoxConstraints.tightFor(width: 327.w, height: 60.h),
      borderSize: 18.dm,
      hintText: AppStrings.search.tr(),
      onTap: () {
        AppNavigator.navigateNamedTo(context, AppRoutes.searchScreen);
      },
      prefixIcon: Icon(
        Icons.search,
        size: 25.dm,
      ),
    );
  }
}
