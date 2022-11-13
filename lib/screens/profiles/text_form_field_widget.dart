import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/utils/app_text_styles.dart';

import '../../utils/app_colors.dart';

String? textHelper;

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
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
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        color: AppColors.lightGrey,
      ),
    );
    var outlineInputBorderError = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        color: AppColors.red,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
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
              suffixIcon: suffixIcon,
              enabledBorder: outlineInputBorder,
              errorBorder: outlineInputBorderError,
              focusedBorder: outlineInputBorder,
              hintStyle: AppTextStyles.textTitle14.copyWith(
                color: AppColors.grey,
              ),
              hintText: hintText,
              filled: true,
              fillColor: AppColors.lightGrey,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validateFunctionEmpty,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Text(
            textHelper ?? '',
            style: const TextStyle(
              fontSize: 11,
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
