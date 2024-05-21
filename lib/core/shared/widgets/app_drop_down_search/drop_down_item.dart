import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';



class DropDownItem extends StatelessWidget {
  const DropDownItem({
    super.key,
    required this.isSelected,
    required this.content,
    this.leading,
  });
  final bool isSelected;
  final String content;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: isSelected
              ? AppColors.borderColor.withOpacity(0.5)
              : Colors.transparent,
          // color: Colors.transparent,
          child: ListTile(
            leading: leading,
            title: Text(
              content,
              style: AppTextStyles.style15,
            ),
            trailing: isSelected
                ? const Icon(
                    Icons.done_rounded,
                    color: AppColors.lightGrey,
                  )
                : null,
          ),
        ),
        Container(
          color: AppColors.scaffoldBackgroundColor,
          child: const Divider(),
        ),
      ],
    );
  }
}
