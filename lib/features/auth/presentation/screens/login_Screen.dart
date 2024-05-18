import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/config/routes/app_navigator.dart';
import 'package:spt_clone/core/packages/app_loading.dart';
import 'package:spt_clone/core/utils/app_assets.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_strings.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/core/utils/sizes.dart';
import 'package:spt_clone/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/packages/toast.dart';
import '../../../../core/shared/widgets/scaffold_red_corner.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_formatters.dart';
import '../widgets/my_Textfiled.dart';
import '../widgets/my_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  late AuthCubit authCubit;
  @override
  void initState() {
    authCubit = AuthCubit.get(context);
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldRedCorner(
        appBar: null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSizes.s90.h,
                  ),
                  Center(
                      child: Image.asset(ImagesAssets.logo, fit: BoxFit.cover)),
                  SizedBox(
                    height: AppSizes.s48.h,
                  ),
                  Text(
                    AppStrings.logIn.tr(),
                    style: AppTextStyles.style24.bold,
                  ),
                  SizedBox(
                    height: AppSizes.s15.h,
                  ),
                  Text(
                    AppStrings.welcome.tr(),
                    style: AppTextStyles.style14.grey,
                  ),
                  SizedBox(
                    height: AppSizes.s15.h,
                  ),
                  Text(
                    AppStrings.phoneNumber.tr(),
                    style: AppTextStyles.style14.bold,
                  ),
                  SizedBox(
                    height: AppSizes.s15.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: AppSizes.s60.h,
                    child: PhoneFormFiled(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required.tr();
                        }
                        return null;
                      },
                      borderColor: AppColors.borderColor,
                      borderSize: AppSizes.s4,
                      controller: phoneController,
                      inputFormatters: [
                        AppInputFormatters.lengthLimitingTextInputFormatter(9),
                        AppInputFormatters.denyArabicNumbers,
                        AppInputFormatters.denySpace,
                        AppInputFormatters.noSpecialCharsFilter
                      ],
                      hintText: AppStrings.phoneNumber.tr(),
                      hintStyle: AppTextStyles.style14gray.grey,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.s28.h,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is SendOtpLoading) {
                        appLoading(loadingType: LoadingType.loading);
                      }
                      if (state is SendOtpSuccess) {
                        appLoading(loadingType: LoadingType.dismiss);

                        AppNavigator.navigateNamedTo(
                            context, AppRoutes.otpScreen,
                            arguments: phoneController.text);
                      }
                      if (state is SendOtpError) {
                        appLoading(loadingType: LoadingType.dismiss);

                        ShowMessageToast.setMessage(
                            message: '${state.error}', type: ToastType.error);
                        authCubit.getCityListUseCase(param: '50');
                        AppNavigator.navigateNamedTo(
                            context, AppRoutes.signUpScreen,
                            arguments: phoneController.text);
                      }
                    },
                    builder: (context, state) {
                      return AppMainButton(
                        fillColor: AppColors.redColor,
                        text: AppStrings.logIn.tr(),
                        textColor: AppColors.whiteTextColor,
                        onPressed: phoneController.text.isEmpty
                            ? () {}
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  authCubit.sendOtp(
                                    recipient: phoneController.text,
                                  );
                                }
                              },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
