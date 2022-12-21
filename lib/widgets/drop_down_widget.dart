import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.items,
    required this.hintText,
    required this.onChanged,
    // this.selectedItem,
    // required this.onDelete,
  }) : super(key: key);

  final List<String> items;
  // String? selectedItem;
  final String hintText;
  final void Function(String?) onChanged;
  // final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.17),
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(
              16.r,
            ),
          ),
        ),
        DropdownSearch<String>(
          clearButtonProps: const ClearButtonProps(
            isVisible: true,
            // onPressed: () {

            // },
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
          ),
          // enabled: false,

          // clearButtonProps: ClearButtonProps(
          //   autofocus: true,
          //   color: Colors.red,
          //   enableFeedback: true,
          //   iconSize: 42,
          //   alignment: Alignment.center,
          //   icon: Icon(Icons.highlight_remove_rounded),
          //   constraints: BoxConstraints(
          //     minWidth: 10.r,
          //     minHeight: 10.r,
          //   ),
          // ),

          dropdownButtonProps: const DropdownButtonProps(
              icon: Icon(Icons.keyboard_arrow_down_rounded)),
          popupProps: const PopupProps.dialog(
            // onDismissed: onDismissed,
            showSelectedItems: true,
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(hintText: 'Search..'),
            ),
          ),

          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 16.h,
                bottom: 16.h,
                left: 8.w,
              ),
              isDense: false,
              hintStyle: AppTextStyles.textStyle14.copyWith(
                color: AppColors.grey,
              ),
              hintText: hintText,
              fillColor: AppColors.sugarWhite,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                  color: AppColors.sugarWhite,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                  color: AppColors.sugarWhite,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
              ),
            ),
          ),
          items: items,

          onChanged: onChanged,
          // selectedItem: null,
          // selectedItem: selectedItem,

          //// OLD VERSION
          // showClearButton: false,
          // dropdownButtonProps: IconButtonProps(
          //   icon: Icon(Icons.keyboard_arrow_down_rounded),
          // ),

          //   popupProps: const PopupProps.dialog(
          //   // onDismissed: onDismissed,
          //   showSelectedItems: true,
          //   showSearchBox: true,
          //   searchFieldProps: TextFieldProps(
          //     decoration: InputDecoration(hintText: 'Search..'),
          //   ),
          // ),

          // dropdownSearchDecoration: InputDecoration(
          //   contentPadding: EdgeInsets.symmetric(
          //     vertical: 16.h,
          //     horizontal: 16.w,
          //   ),
          //   isDense: false,
          //   hintStyle:
          //       AppTextStyles.textStyle14.copyWith(color: AppColors.grey),
          //   hintText: hintText,
          //   fillColor: AppColors.sugarWhite,
          //   filled: true,
          //   border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.r),
          //     borderSide: BorderSide.none,
          //   ),
          //   focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.r),
          //     borderSide: const BorderSide(
          //       color: AppColors.sugarWhite,
          //     ),
          //   ),
          //   focusedErrorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.r),
          //     borderSide: const BorderSide(
          //       color: AppColors.red,
          //     ),
          //   ),
          //   enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.r),
          //     borderSide: const BorderSide(
          //       color: AppColors.sugarWhite,
          //     ),
          //   ),
          //   errorBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(16.r),
          //     borderSide: const BorderSide(
          //       color: AppColors.red,
          //     ),
          //   ),
          // ),
        ),
      ],
    );
  }
}
