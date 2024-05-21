import 'package:flutter/material.dart';

import '../../../utils/app_textstyles.dart';



class DropDownTitleTile extends StatelessWidget {
  const DropDownTitleTile({
    super.key,
    required this.labelText,
  });
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        top: 12.0,
        right: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            labelText,
            style: AppTextStyles.style15,
          ),

        ],
      ),
    );
  }
}
