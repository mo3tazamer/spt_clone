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
import '../../../../core/shared/widgets/app_drop_down_search/app_drop_down_search.dart';
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

  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    ShowMessageToast.setMessage(message: 'new user', type: ToastType.success);
    authCubit = AuthCubit.get(context);

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
          child: Form(
            key: _key,
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
                AppDropDownSearch<CityEntity>(
                  labelText: 'select The City',
                  hintText: 'select The City',
                  itemAsString: (city) => city.name!,
                  showSearchBox: true,
                  searchTitle: 'searchDots',
                  asyncItems: (_) async {
                    if (authCubit.cities.isEmpty) {
                      await authCubit.getCityList(param: '50');
                    }
                    return authCubit.cities;
                  },
                  selectedItem: authCubit.selectedCity,
                  onChanged: authCubit.onChangedCity,
                  validator: (brand) {
                    if (brand == null) {
                      return 'selectTheCity';
                    }
                    return null;
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(
                  height: AppSizes.s15.h,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is RegisterLoading) {
                      appLoading(
                        loadingType: LoadingType.loading,
                      );
                    }
                    if (state is RegisterError) {
                      appLoading(loadingType: LoadingType.dismiss);
                      ShowMessageToast.setMessage(
                          message: '${state.error}', type: ToastType.error);
                    }
                    if (state is RegisterSuccess) {
                      appLoading(loadingType: LoadingType.dismiss);
                      /// navigate to home Screen
                    }
                  },
                  builder: (context, state) {
                    return AppMainButton(
                      text: AppStrings.logIn.tr(),
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          authCubit.register(
                            name: nameController.text,
                            phone: authCubit.userPhone,
                            cityId: '${authCubit.selectedCity?.id}',
                          );

                        }

                      },
                      fillColor: AppColors.redColor,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
