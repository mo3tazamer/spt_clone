import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/features/home/presentation/widgets/custom_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> _notifications = List.generate(10, (index) => {
    'time': '08:00',
    'title': 'Notification $index',
    'details': 'تفاصيل الاشعار',
    'date': DateTime.now().subtract(Duration(days: index)).toString()
  }); // Initial notifications
  bool _isLoading = false;
  int _currentMax = 10;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _fetchMoreData();
    }
  }

  Future<void> _fetchMoreData() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      // Simulate a delay for fetching data
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _currentMax = _currentMax + 10;
        _notifications.addAll(List.generate(10, (index) => {
          'time': '08:00',
          'title': 'Notification ${_currentMax + index}',
          'details': 'تفاصيل الاشعار تفاصيل الاشعار تفاصيل الاشعار',
          'date': DateTime.now().subtract(Duration(days: _currentMax + index)).toString()
        }));
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'الاشعارات',
          style: AppTextStyles.style16.copyColorWith(Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0.dm),
        child: Column(
          children: [
            Expanded(
              child: GroupedListView<Map<String, String>, String>(
                controller: _scrollController,
                elements: _notifications,
                groupBy: (notification) => notification['date']!.substring(0, 10),
                groupSeparatorBuilder: (String date) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    date,
                    style: AppTextStyles.style16.copyColorWith(Colors.black),
                  ),
                ),
                itemBuilder: (context, notification) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      notificationModel(notification),
                      SizedBox(height: 20.h),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  );
                },
               itemComparator: (item1, item2) => item1['date']!.compareTo(item2['date']!),
                //useStickyGroupSeparators: true,
                //floatingHeader: true,
                order: GroupedListOrder.DESC,
              ),
            ),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}

Widget notificationModel(Map<String, String> notification) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(notification['time']!),
      Text(notification['title']!),
      Text(notification['details']!),
    ],
  );
}
