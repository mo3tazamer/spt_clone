import 'package:flutter/material.dart';
import 'package:spt_clone/core/shared/widgets/custom_tabbar.dart';

import '../../../home/presentation/widgets/new_spair_parts_stores.dart';
import '../../../home/presentation/widgets/offers_list.dart';

class SearchTabs extends StatefulWidget {
  const SearchTabs(
      {super.key, required this.selectedIndex, required this.onTabSelected});
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  @override
  State<SearchTabs> createState() => _SearchTabsState();
}

class _SearchTabsState extends State<SearchTabs> {
  @override
  Widget build(BuildContext context) {
    List<TabItem> tabItems = [
      TabItem(label: 'الكل', index: widget.selectedIndex), //TabItem
      TabItem(label: 'المتاجر', index: widget.selectedIndex), //TabItem
      TabItem(label: 'السطحات', index: widget.selectedIndex), //TabItem//TabItem
      TabItem(label: 'ورش الصيانة', index: widget.selectedIndex), //TabItem
    ];
    List<Widget> tabView = [
      const OffersList(),
      const NewSpairPartsStores(),
      const Center(child: Text('Content 3')),
      const Center(child: Text('Content 4')),

    ];
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      child: CustomTabBar(
          selectedIndex: widget.selectedIndex,
          onTabSelected: widget.onTabSelected,
          tabItems: tabItems,
          tabView: tabView),
    );
  }
}
