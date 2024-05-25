import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spt_clone/core/utils/app_extensions.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyles.dart';

final class CustomTextFieldProps extends TextFieldProps {
  final String? searchTitle;
  final TextInputType? searchFieldInputType;

  CustomTextFieldProps({
    super.controller,
    super.textInputAction,
    super.textCapitalization,
    super.strutStyle,
    super.textAlign,
    super.textAlignVertical,
    super.textDirection,
    super.readOnly,
    super.contextMenuBuilder,
    super.showCursor,
    super.autofocus,
    super.obscuringCharacter,
    super.obscureText,
    super.autocorrect,
    super.smartDashesType,
    super.smartQuotesType,
    super.enableSuggestions,
    super.maxLines,
    super.minLines,
    super.expands,
    super.maxLength,
    super.maxLengthEnforcement,
    super.onAppPrivateCommand,
    super.inputFormatters,
    super.enabled,
    super.cursorWidth,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorColor,
    super.selectionHeightStyle,
    super.selectionWidthStyle,
    super.keyboardAppearance,
    super.scrollPadding,
    super.padding,
    super.dragStartBehavior,
    super.enableInteractiveSelection,
    super.selectionControls,
    super.onTap,
    super.mouseCursor,
    super.buildCounter,
    super.scrollController,
    super.scrollPhysics,
    super.autofillHints,
    super.restorationId,
    super.clipBehavior,
    super.enableIMEPersonalizedLearning,
    super.focusNode,
    required this.searchTitle,
    required this.searchFieldInputType,
  });

  @override
  TextStyle? get style => AppTextStyles.style14;

  @override
  TextInputType? get keyboardType => searchFieldInputType;

  @override
  InputDecoration get decoration => InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        hintText: searchTitle,
        hintStyle: AppTextStyles.style14.copyColorWith(AppColors.lightGrey),
        border: _buildFieldBorder(),
        focusedBorder: _buildFieldBorder(),
        disabledBorder: _buildFieldBorder(),
        enabledBorder: _buildFieldBorder(),
        errorStyle: TextStyle(
          fontSize: 12.sp,
        ),
      );

  UnderlineInputBorder _buildFieldBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.lightGrey,
      ),
    );
  }
}
