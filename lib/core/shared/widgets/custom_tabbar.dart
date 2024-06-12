import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final List<TabItem> tabItems;
  final List<Widget> tabView;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.tabItems,
    required this.tabView,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65.0,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.tabItems.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => _buildTabItem(
                  index: index, label: widget.tabItems[index].label)),
        ),
        Expanded(
          child: widget.tabView[widget.selectedIndex],
        ),
      ],
    );
  }

  Widget _buildTabItem({required int index, required String label}) {
    bool isSelected = index == widget.selectedIndex;
    return GestureDetector(
      onTap: () => widget.onTabSelected(index),
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          border:
              Border.all(color: isSelected ? Colors.red : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected ? Colors.red.shade100 : Colors.white10,
        ),
        duration: const Duration(milliseconds: 300),
        child: ScaleTransition(
          scale: isSelected
              ? Tween<double>(begin: 1.0, end: 1.1).animate(
                  CurvedAnimation(
                    parent: CurvedAnimation(
                      parent: AnimationController(
                        vsync: this,
                        duration: const Duration(milliseconds: 300),
                      ),
                      curve: Curves.easeInBack,
                    ),
                    curve: Curves.easeInOutBack,
                  ),
                )
              : Tween<double>(begin: 1.1, end: 1.0).animate(
                  CurvedAnimation(
                    parent: CurvedAnimation(
                      parent: AnimationController(
                        vsync: this,
                        duration: const Duration(milliseconds: 300),
                      ),
                      curve: Curves.easeInOut,
                    ),
                    curve: Curves.easeInOut,
                  ),
                ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.red : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class TabItem {
  final int index;
  final String label;

  TabItem({
    required this.index,
    required this.label,
  });
}
