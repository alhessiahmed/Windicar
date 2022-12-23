import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/utils/app_colors.dart';

class AppTextStyles {
  static TextStyle logoTextStyle = TextStyle(
    color: AppColors.white,
    fontSize: 64.sp,
    fontFamily: 'CenturyGothic',
  );

  static TextStyle textStyle12 = TextStyle(
    color: AppColors.black,
    fontSize: 12.sp,
    // fontWeight: FontWeight.w500,
    fontFamily: 'SFCompactDisplay',
  );

  static TextStyle textStyle14 = TextStyle(
    color: AppColors.black,
    fontSize: 14.sp,
    // fontWeight: FontWeight.w500,
    fontFamily: 'SFCompactDisplay',
  );

  static TextStyle whiteTextStyle14 = textStyle14.copyWith(
    color: AppColors.white,
  );

  static TextStyle darkGreenTextStyle14 = textStyle14.copyWith(
    color: AppColors.darkGreen,
  );

  static TextStyle textStyle16 = TextStyle(
    fontSize: 16.sp,
    // fontWeight: FontWeight.w600,
    fontFamily: 'SFCompactDisplay',
  );

  static TextStyle textStyle17 = TextStyle(
    color: AppColors.black,
    fontSize: 17.sp,
    // fontWeight: FontWeight.w600,
    fontFamily: 'SFCompactDisplay',
  );

  static TextStyle darkGreenTextStyle17 = textStyle17.copyWith(
    color: AppColors.darkGreen,
  );

  static TextStyle whiteTextStyle17 = textStyle17.copyWith(
    color: AppColors.white,
  );
}
