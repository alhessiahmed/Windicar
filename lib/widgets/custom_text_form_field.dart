import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/utils/app_text_styles.dart';

import '../utils/app_colors.dart';

String? textHelper;

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    this.maxLines,
    this.textInputType = TextInputType.name,
    this.suffixIcon,
    this.isPassword = false,
  });

  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  final int? maxLines;
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final bool isPassword;

  // final String? Function(String?) validateFunction;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(
        color: AppColors.sugarWhite,
      ),
    );
    var outlineInputBorderError = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(
        color: AppColors.red,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          // clipBehavior: Clip.hardEdge,
          elevation: 3,
          child: TextFormField(
            textInputAction: textInputAction,
            maxLines: maxLines ?? 1,
            keyboardType: textInputType,
            controller: textEditingController,
            obscureText: isPassword,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14.sp,
            ),
            decoration: InputDecoration(
              // contentPadding: EdgeInsets.symmetric(
              //   vertical: 21.h,
              //   horizontal: 24.w,
              // ),
              // isDense: true,
              suffixIcon: Padding(
                padding: EdgeInsetsDirectional.only(
                  end: 16.w,
                ),
                child: suffixIcon,
              ),
              prefixIcon: SizedBox(
                width: 16.w,
                height: 16.h,
              ),
              prefixIconConstraints: BoxConstraints(
                maxWidth: 16.w,
              ),
              // suffixIcon: suffixIcon,
              suffixIconConstraints: BoxConstraints(
                maxHeight: 21.h,
                maxWidth: 37.h,
              ),
              enabledBorder: outlineInputBorder,
              errorBorder: outlineInputBorderError,
              focusedBorder: outlineInputBorder,
              hintStyle: AppTextStyles.textStyle14.copyWith(
                color: AppColors.grey,
              ),
              hintText: hintText,
              filled: true,
              fillColor: AppColors.sugarWhite,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateFunctionEmpty,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 16.w,
          ),
          child: Text(
            textHelper ?? '',
            style: TextStyle(
              fontSize: 11.sp,
              color: AppColors.red,
            ),
          ),
        ),
      ],
    );
  }

  String? validateFunctionEmpty(value) {
    if (value != null && value.isEmpty) {
      textHelper = '*Requerid';
      print(textHelper);
    } else {
      textHelper = '';
    }
    return null;
  }
}
