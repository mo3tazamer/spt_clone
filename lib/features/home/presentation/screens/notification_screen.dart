import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/features/home/presentation/widgets/custom_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'الاشعارات',
          style: AppTextStyles.style16.copyColorWith(Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(18.0.dm),
        children: [
          notificationModel(),
          SizedBox(
            height: 20.h,
          ),
          notificationModel(),
          SizedBox(
            height: 20.h,
          ),
          notificationModel(),
          SizedBox(
            height: 20.h,
          ),
          notificationModel(),
          SizedBox(
            height: 20.h,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          notificationModel(),
          SizedBox(
            height: 20.h,
          ),
          notificationModel(),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}

Widget notificationModel() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('08:00'),
      Text('عنوان رئيسي للاشعار'),
      Text('تفاصيل الاشعار تفاصيل الاشعار تفاصيل الاشعار '),
    ],
  );
}
