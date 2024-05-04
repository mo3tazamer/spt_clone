import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spt_clone/auth/presentation/widgets/svg_image.dart';
import 'package:spt_clone/core/utils/app_assets.dart';
import 'package:spt_clone/core/utils/sizes.dart';

import '../../../core/utils/app_colors.dart';

class PhoneFormFiled extends StatelessWidget {
  const PhoneFormFiled(
      {super.key,
      this.hintText,
      this.labelText,
      this.validator,
      this.controller,
      this.keyboardType,
      this.labelStyle,
      this.obscureText = false,
      this.fillColor = AppColors.whitePrimaryColor,
      this.borderSize = AppSizes.s28,
      this.hintStyle,
      this.borderColor = AppColors.borderColor,
      this.focusColor, this.inputFormatters});

  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusColor;
  final List<TextInputFormatter>? inputFormatters;

  final double? borderSize;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      obscureText: obscureText!,
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        focusColor: focusColor,
        hintText: hintText,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: const IconButton(
          onPressed: null,
          icon: AppSvgImage(
            image: IconAssets.call,
            color: AppColors.redColor,
          ),
        ),
        suffixIcon:  IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              VerticalDivider(color: borderColor!),
              const CountryCodePicker(
                onChanged: null,
                initialSelection: '+966',
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: ['+966'],
              ),
            ],
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderSize!),
          borderSide: BorderSide(color: borderColor!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderSize!),
          borderSide: BorderSide(color: borderColor!),
        ),
      ),
    );
  }
}
