// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:logo/utils/app_colors.dart';
// import 'package:logo/utils/app_text_styles.dart';

// String? textHelper;

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     this.textInputAction = TextInputAction.next,
//     this.maxLines,
//     this.textInputType = TextInputType.name,
//     this.suffixIcon,
//     this.isPassword = false,
//   });

//   final TextEditingController controller;
//   final TextInputAction textInputAction;
//   final int? maxLines;
//   final String hintText;
//   final TextInputType textInputType;
//   final Widget? suffixIcon;
//   final bool isPassword;

//   // final String? Function(String?) validateFunction;

//   @override
//   Widget build(BuildContext context) {
//     var outlineInputBorder = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(16.r),
//       borderSide: const BorderSide(
//         color: AppColors.sugarWhite,
//       ),
//     );
//     var outlineInputBorderError = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(16.r),
//       borderSide: const BorderSide(
//         color: AppColors.red,
//       ),
//     );
//     return Column(
//       // mainAxisAlignment: MainAxisAlignment.center,
//       // crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Card(
//           // margin: EdgeInsets.zero,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16.r),
//           ),
//           // clipBehavior: Clip.hardEdge,
//           elevation: 3,
//           child: TextFormField(
//             textInputAction: textInputAction,
//             maxLines: maxLines ?? 1,
//             keyboardType: textInputType,
//             controller: controller,
//             obscureText: isPassword,
//             style: TextStyle(
//               color: AppColors.grey,
//               fontSize: 14.sp,
//             ),
//             decoration: InputDecoration(
//               contentPadding: EdgeInsets.symmetric(vertical: 16.h),
//               isDense: false,
//               suffixIcon: Padding(
//                 padding: EdgeInsetsDirectional.only(
//                   end: 16.w,
//                 ),
//                 child: suffixIcon,
//               ),
//               prefixIcon: SizedBox(
//                 width: 16.w,
//                 height: 16.h,
//               ),
//               prefixIconConstraints: BoxConstraints(
//                 maxWidth: 16.w,
//               ),
//               // suffixIcon: suffixIcon,
//               suffixIconConstraints: BoxConstraints(
//                 maxHeight: 21.h,
//                 maxWidth: 37.h,
//               ),
//               enabledBorder: outlineInputBorder,
//               errorBorder: outlineInputBorderError,
//               focusedBorder: outlineInputBorder,
//               hintStyle: AppTextStyles.textStyle14.copyWith(
//                 color: AppColors.grey,
//               ),
//               hintText: hintText,
//               filled: true,
//               fillColor: AppColors.sugarWhite,
//             ),
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             validator: (value) {
//               return validateFunctionEmpty(value);
//             },
//           ),
//         ),
//         Visibility(
//           visible: textHelper?.isNotEmpty ?? false,
//           child: Padding(
//             padding: EdgeInsetsDirectional.only(
//               start: 16.w,
//             ),
//             child: Text(
//               textHelper ?? '',
//               style: TextStyle(
//                 fontSize: 11.sp,
//                 color: AppColors.red,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   String? validateFunctionEmpty(String? value) {
//     if (value != null && value.isEmpty) {
//       textHelper = '*Obligatoire';
//       print(textHelper);
//     } else {
//       textHelper = '';
//     }
//     return null;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isPassword = false,
    this.isEmail = false,
    this.isPhone = false,
    this.hasEditIcon = false,
    this.maxLines = 1,
    this.onChange,
    this.onSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final Widget? suffixIcon;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final bool hasEditIcon;
  final int maxLines;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;

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
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required *';
            } else if (isPassword && value.length < 6) {
              return 'Password must be 6 characters at least!';
            } else if (isEmail &&
                (!value.contains('@') || !value.contains('.'))) {
              return 'Enter valid email!';
            } else if (isPhone && value.length != 10) {
              return 'Enter valid phone number!';
            }
            return null;
          },
          textInputAction: textInputAction,
          keyboardType: isEmail
              ? TextInputType.emailAddress
              : isPhone
                  ? TextInputType.number
                  : keyboardType,
          obscureText: obscureText,
          style: AppTextStyles.textStyle14,
          cursorColor: AppColors.grey,
          // cursorHeight: 20.h,
          maxLines: maxLines,
          maxLength: isPhone ? 10 : null,
          onChanged: onChange,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            counterText: '',
            contentPadding:
                EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            isDense: false,
            hintText: hintText,
            hintStyle: AppTextStyles.textStyle14.copyWith(
              color: AppColors.grey,
            ),
            suffixIcon: Padding(
              padding: EdgeInsetsDirectional.only(end: 16.w),
              child: hasEditIcon
                  ? SvgPicture.asset(
                      'assets/images/ic_edit.svg',
                      height: 21.h,
                      width: 21.w,
                      color: AppColors.grey,
                    )
                  : suffixIcon,
            ),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 21.h,
              // maxWidth: 57.h,
            ),
            errorMaxLines: 2,
            errorStyle: const TextStyle(
              color: AppColors.red,
            ),
            filled: true,
            fillColor: AppColors.sugarWhite,
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
      ],
    );
  }
}
