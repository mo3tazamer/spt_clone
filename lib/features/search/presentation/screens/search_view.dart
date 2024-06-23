import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/shared/widgets/app_text_field.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/features/home/presentation/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_textstyles.dart';
import '../widgets/search_tabs.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _onSearch(_controller.text);
  }

  void _onSearch(String query) {
    EasyDebounce.debounce('search-debounce', const Duration(milliseconds: 500),
        () => _performSearch(query));
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      _performDefaultAction();
      return;
    }

    switch (_selectedIndex) {
      case 0:
        _searchAll(query);
        break;
      case 1:
        _searchStores(query);
        break;
      case 2:
        _searchParts(query);
        break;
      case 3:
        _searchInTab4(query);
        break;

      default:
        _handleInvalidTab();
    }
  }

  void _performDefaultAction() {
    print('Query is empty, perform default action');
  }

  void _searchAll(String query) {
    /// call search API here
    print('Searching in all: $query');
  }

  void _searchStores(String query) {
    /// call search API here
    print('Searching in stores: $query');
  }

  void _searchParts(String query) {
    /// call search API here
    print('Searching in parts: $query');
  }

  void _searchInTab4(String query) {
    /// call search API here
    print('Searching in Tab 4: $query');
  }

  void _handleInvalidTab() {
    print('Invalid tab selected');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'نتائج البحث',
          style: AppTextStyles.style16.copyColorWith(Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTextField(
              focusNode: _focusNode,
              onChanged: _onSearch,
              onFieldSubmitted: _onSearch,
              controller: _controller,
              constraints: BoxConstraints.tightFor(width: 345.w, height: 60.h),
              borderSize: 18.dm,
              hintText: AppStrings.search.tr(),
              prefixIcon: Icon(
                Icons.search,
                size: 25.dm,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  icon: Icon(
                    Icons.clear_rounded,
                    size: 25.dm,
                  )),
            ),
            SearchTabs(
              onTabSelected: _onTabSelected,
              selectedIndex: _selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
