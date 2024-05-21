import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';


final class CustomDropDownDecoratorProps extends DropDownDecoratorProps {
  final String? leadingText;
  final String? hintText;

  CustomDropDownDecoratorProps({
    super.textAlign,
    super.textAlignVertical,
    required this.leadingText,
    required this.hintText,
  });

  @override
  TextStyle? get baseStyle => AppTextStyles.style15;
  @override
  InputDecoration? get dropdownSearchDecoration => InputDecoration(
        prefixIcon: leadingText != null
            ? TextButton(
                onPressed: null,
                child: Text(
                  leadingText!,
                  style: AppTextStyles.style15.copyWith(
                    color: AppColors.lightGrey,
                  ),
                ),
              )
            : null,
        suffixIconColor: const Color(0xff3E3D3E),
        hintText: hintText,
        hintStyle: AppTextStyles.style15,
        border: _buildDropDownBorder(),
        disabledBorder: _buildDropDownBorder(),
        errorStyle: AppTextStyles.style14.copyColorWith(AppColors.redColor),
        enabledBorder: _buildDropDownBorder(),
        errorBorder: _buildDropDownBorder().copyWith(
          borderSide: const BorderSide(
            color: AppColors.redColor,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      );

  OutlineInputBorder _buildDropDownBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(
        color: AppColors.lightGrey,
      ),
    );
  }
}
