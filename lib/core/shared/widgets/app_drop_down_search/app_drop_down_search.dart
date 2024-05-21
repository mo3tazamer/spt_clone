

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


import '../../../utils/sizes.dart';
import 'drop_down_appearance.dart';
import 'drop_down_item.dart';
import 'drop_down_loading_indicator.dart';
import 'drop_down_title_tile.dart';
import 'search_field_appearance.dart';

typedef ItemBuilderCallBack<T> = Widget Function(
  BuildContext context,
  T item,
  bool isSelected,
);
typedef DropDownAsyncItemsCallback<T> = Future<List<T>> Function(
    String filter)?;
typedef DropDownOnChangedCallback<T> = void Function(T? selectedItem)?;
typedef ItemAsStringCallBack<T> = String Function(T)?;

class AppDropDownSearch<T> extends StatelessWidget {
  const AppDropDownSearch({
    super.key,
    this.asyncItems,
    this.onChanged,
    this.hintText,
    this.selectedItem,
    this.searchTitle,
    this.notFoundItemText,
    this.offlineItems = const [],
    this.labelText,
    this.searchFieldInputType,
    this.showSearchBox = false,
    this.enabled = true,
    this.bottomSheetHeight = 0.86,
    this.leadingText,
    this.itemBuilder,
    this.itemAsString,
    this.validator,
    this.dropDownDecoratorProps,
    this.isMenu = false,
    this.loadingIndicatorProps = const LoadingIndicatorProps(),
    this.autoValidateMode = AutovalidateMode.disabled,
    this.emptyBuilder,
    this.headerText,
    this.withMandatorySign = false,
  });

  final DropDownAsyncItemsCallback<T> asyncItems;
  final DropDownOnChangedCallback<T> onChanged;
  final ItemBuilderCallBack<T>? itemBuilder;
  final ItemAsStringCallBack<T>? itemAsString;
  final EmptyBuilder? emptyBuilder;
  final String? hintText;
  final String? searchTitle;
  final String? notFoundItemText;
  final T? selectedItem;
  final List<T> offlineItems;
  final String? labelText;
  final String? headerText;
  final bool withMandatorySign;
  final TextInputType? searchFieldInputType;
  final bool showSearchBox;
  final bool enabled;
  final double bottomSheetHeight;
  final String? leadingText;
  final FormFieldValidator<T>? validator;
  final DropDownDecoratorProps? dropDownDecoratorProps;
  final bool isMenu;
  final LoadingIndicatorProps loadingIndicatorProps;
  final AutovalidateMode? autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (_, isKeyboardVisible) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

             const Gap(AppSizes.s10),
            DropdownSearch<T>(
              enabled: enabled,
              onChanged: onChanged,
              validator: validator,
              autoValidateMode: autoValidateMode,
              asyncItems: asyncItems,
              items: offlineItems,
              itemAsString: itemAsString,
              selectedItem: selectedItem,
              dropdownDecoratorProps: dropDownDecoratorProps ??
                  CustomDropDownDecoratorProps(
                    hintText: hintText,
                    leadingText: leadingText,
                  ),
              popupProps: isMenu == true
                  ? const PopupProps.menu(
                      fit: FlexFit.loose,
                    )
                  : PopupProps.modalBottomSheet(
                      emptyBuilder: emptyBuilder ?? _emptyBuilder,
                      // errorBuilder: _buildErrorBuilder,
                      // showSelectedItems: true,
                      title: labelText != null
                          ? DropDownTitleTile(
                              labelText: labelText!,
                            )
                          : null,
                      listViewProps: ListViewProps(
                        padding: EdgeInsets.only(
                          bottom: isKeyboardVisible ? 0.36.sh : AppSizes.zero,
                        ),
                      ),
                      showSearchBox: showSearchBox,
                      searchFieldProps: CustomTextFieldProps(
                        searchTitle: searchTitle,
                        searchFieldInputType: searchFieldInputType,
                      ),
                      itemBuilder: itemBuilder ?? _searchedItemBuilder,
                      loadingBuilder: _popupLoadingIndicatorBuilder,

                      //fit: FlexFit.loose,
                      modalBottomSheetProps: ModalBottomSheetProps(
                        useRootNavigator: true,
                        backgroundColor: Colors.white,
                        constraints: BoxConstraints(
                          minHeight: bottomSheetHeight.sh,
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _popupLoadingIndicatorBuilder(context, searchEntry) {
    return DropDownLoadingIndicator(
      loadingIndicatorProps: loadingIndicatorProps,
    );
  }

  Widget _emptyBuilder(context, searchEntry) {
    return const Center(
      child: SingleChildScrollView(
        // child: EmptyWidget(
        //   icon: '',
        //   title: 'noItemsMatch',
        // ),
      ),
    );
  }

  // Widget _buildErrorBuilder(context, searchEntry, exception) {
  //   if (exception is Failure) {
  //     return ErrorScreenHandler(
  //       failure: exception,
  //       showBackButton: false,
  //       transparentBackground: true,
  //       onTyAgainPressed: null,
  //       buttonBuilder: (context) => Text(
  //         AppStrings.closePageToTryAgain,
  //         style: AppTextStyles.style15.copyColorWith(AppColors.lightGrey),
  //         textAlign: TextAlign.center,
  //       ),
  //     );
  //   }
  //   return ErrorScreen(
  //     errorMessage: AppStrings.somethingWentWrong,
  //     showBackButton: false,
  //     transparentBackground: true,
  //     onTyAgainPressed: null,
  //     buttonBuilder: (context) => Text(
  //       AppStrings.closePageToTryAgain,
  //       style: AppTextStyles.style15.copyColorWith(AppColors.lightGrey),
  //       textAlign: TextAlign.center,
  //     ),
  //   );
  // }

  Widget _searchedItemBuilder(BuildContext context, T item, _) {
    return DropDownItem(
      isSelected: item == selectedItem,
      content: _selectedItemAsString(item),
    );
  }

  ///this function is used to returns the String value of an object
  String _selectedItemAsString(T? item) {
    if (item == null) {
      return "";
    } else if (itemAsString != null) {
      return itemAsString!(item);
    } else {
      return item.toString();
    }
  }
}
