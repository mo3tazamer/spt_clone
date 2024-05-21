import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:spt_clone/core/packages/app_loading.dart';
import 'package:spt_clone/core/packages/toast.dart';
import 'package:spt_clone/core/shared/widgets/scaffold_red_corner.dart';
import 'package:spt_clone/core/utils/app_colors.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/core/utils/sizes.dart';
import 'package:spt_clone/features/auth/presentation/cubit/auth_cubit.dart';

import '../../../../core/utils/app_formatters.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/my_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController pinController = TextEditingController();
  late AuthCubit authCubit;

  @override
  void initState() {
    authCubit = AuthCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldRedCorner(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSizes.s50.h,
                  ),
                  Text(
                    AppStrings.identifyCode.tr(),
                    style: AppTextStyles.style24.bold,
                  ),
                  SizedBox(
                    height: AppSizes.s20.h,
                  ),
                  Text(
                    AppStrings.pleaseEnterTheVerificationCode.tr(),
                    style: AppTextStyles.style14.grey,
                  ),
                  SizedBox(
                    height: AppSizes.s20.h,
                  ),
                  Text(
                    /// TODO: add phone number
                    '+45645645756',
                    style: AppTextStyles.style14.grey,
                  ),
                  SizedBox(
                    height: AppSizes.s20.h,
                  ),
                  Center(
                    child: Pinput(
                      controller: pinController,
                      inputFormatters: [
                        AppInputFormatters.denyArabicNumbers,
                        AppInputFormatters.noSpecialCharsFilter,
                        AppInputFormatters
                            .nonArabicAndEnglishLetterAndNumbersFilter,
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.required.tr();
                        }
                        return null;
                      },
                    ),
                  ),
                  Text(
                    AppStrings.otpMsg.tr(),
                    style: AppTextStyles.style14.grey,
                  ),
                  SizedBox(
                    height: AppSizes.s20.h,
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO: resend code
                    },
                    child: Text(
                      AppStrings.resendCode.tr(),
                      style: AppTextStyles.style14
                          .copyColorWith(AppColors.redColor),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.s20.h,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is VerifyOtpLoading) {
                        appLoading(loadingType: LoadingType.loading);
                      }
                      if (state is VerifyOtpSuccess) {
                        appLoading(loadingType: LoadingType.dismiss);
                      }
                      if (state is VerifyOtpError) {
                        appLoading(loadingType: LoadingType.error);
                        ShowMessageToast.setMessage(
                            message: '${state.error}', type: ToastType.error);
                      }
                    },
                    builder: (context, state) {
                      return AppMainButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            authCubit.verifyOtpUseCase(
                                recipient: authCubit.userPhone,
                                code: pinController.text);
                          }
                        },
                        text: AppStrings.identify.tr(),
                        fillColor: AppColors.redColor,
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
