import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_colors.dart';
import '../../utils/sizes.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.validator,
      this.inputFormatters,
      this.controller,
      this.borderSize = AppSizes.s1,
      this.borderColor = AppColors.lightGrey,
      this.fillColor,
      this.hintText,
      this.labelText,
      this.hintStyle,
      this.labelStyle,
      this.obscureText});
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final double? borderSize;
  final Color? borderColor;
  final Color? fillColor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: TextInputType.name,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderSize!),
          borderSide: BorderSide(color: borderColor!),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderSize!),
          borderSide: BorderSide(color: borderColor!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderSize!),
          borderSide: BorderSide(color: borderColor!),
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        fillColor: fillColor,
      ),
    );
  }
}
