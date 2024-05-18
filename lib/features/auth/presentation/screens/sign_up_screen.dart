import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spt_clone/core/packages/toast.dart';
import 'package:spt_clone/core/shared/widgets/scaffold_red_corner.dart';
import 'package:spt_clone/core/utils/app_extensions.dart';
import 'package:spt_clone/core/utils/app_formatters.dart';
import 'package:spt_clone/core/utils/app_strings.dart';
import 'package:spt_clone/core/utils/app_textstyles.dart';
import 'package:spt_clone/features/auth/domain/entities/city.dart';
import 'package:spt_clone/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:spt_clone/features/auth/presentation/widgets/my_button.dart';

import '../../../../core/packages/app_loading.dart';
import '../../../../core/shared/widgets/app_text_field.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/sizes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthCubit authCubit;
  List<CityEntity> cities = [];
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    authCubit = AuthCubit.get(context);
    cities = authCubit.getCityListUseCase(param: '500') as List<CityEntity>;

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldRedCorner(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.s20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSizes.s90.h,
              ),
              Center(child: Image.asset(ImagesAssets.logo, fit: BoxFit.cover)),
              SizedBox(
                height: AppSizes.s48.h,
              ),
              Text(
                AppStrings.signIn.tr(),
                style: AppTextStyles.style24,
              ),
              SizedBox(
                height: AppSizes.s10.h,
              ),
              Text(
                AppStrings.registerNow.tr(),
                style: AppTextStyles.style14.grey,
              ),
              SizedBox(
                height: AppSizes.s10.h,
              ),
              Text(
                AppStrings.firstName.tr(),
                style: AppTextStyles.style14.bold,
              ),
              SizedBox(
                height: AppSizes.s5.h,
              ),
              AppTextField(
                controller: nameController,
                inputFormatters: [
                  AppInputFormatters.denySpace,
                  AppInputFormatters.lengthLimitingTextInputFormatter(5),
                  AppInputFormatters.nonArabicAndEnglishNumbersFilter,
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.required.tr();
                  }
                  return null;
                },
                hintStyle: AppTextStyles.style14gray,
                hintText: AppStrings.enterName.tr(),
              ),
              SizedBox(
                height: AppSizes.s5.h,
              ),
              Text(
                AppStrings.city.tr(),
                style: AppTextStyles.style14.bold,
              ),
              SizedBox(
                height: AppSizes.s5.h,
              ),
              DropdownSearch<CityEntity>(
                validator:  (value) {
                  if (value == null) {
                    return AppStrings.required.tr();
                  }
                  return null;
                },
                autoValidateMode: AutovalidateMode.onUserInteraction,
                popupProps: const PopupProps.bottomSheet(
                  showSearchBox: true,
                  showSelectedItems: true,
                  fit: FlexFit.loose,
                ),
                selectedItem: authCubit.selectedCity,
                onChanged: (city) {
                  authCubit.onChangedCity(city);
                },
                asyncItems: (_) async {
                  if (authCubit.cities.isEmpty) {
                    await authCubit.getCityListUseCase(param: '50');
                  }
                  return authCubit.cities;
                },
              ),
              SizedBox(
                height: AppSizes.s15.h,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterLoading) {
                    appLoading(loadingType: LoadingType.loading);
                  } else if (state is RegisterError) {
                    appLoading(loadingType: LoadingType.error);
                    ShowMessageToast.setMessage(
                        message: '${state.error}', type: ToastType.error);
                  } else if (state is RegisterSuccess) {
                    /// navigate to home Screen
                  }
                },
                builder: (context, state) {
                  return AppMainButton(
                    text: AppStrings.logIn.tr(),
                    onPressed: () {
                      authCubit.register(
                        name: nameController.text,
                        phone: authCubit.phone,
                        cityId: authCubit.selectedCity.id!,
                      );
                    },
                    fillColor: AppColors.redColor,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
