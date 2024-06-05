import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          onTap: (int index) {
            _tabController.animateTo(index);
            setState(() {});
          },
          splashFactory: NoSplash.splashFactory,
          dividerHeight: 0.0,
          tabs: [
            _CustomTab(text: 'العروض', isSelected: _tabController.index == 0),
            _CustomTab(
                text: 'متاجر قطع غيار جديد',
                isSelected: _tabController.index == 1),
            _CustomTab(
                text: 'متاجر قطع غيار مستعملة',
                isSelected: _tabController.index == 2),
          ],
          controller: _tabController,
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: const [
              Center(child: Text('Content 1')),
              Center(child: Text('Content 2')),
              Center(child: Text('Content 3')),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _CustomTab({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected ? Colors.red[100] : Colors.white,
        border: Border.all(color: isSelected ? Colors.red : Colors.grey),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.style16
              .copyWith(color: isSelected ? Colors.red : Colors.black),
        ),
      ),
    );
  }
}
