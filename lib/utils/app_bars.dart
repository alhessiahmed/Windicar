import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class AppBars {
  static AppBar customeAppBar({
    required BuildContext context,
    required Color backgroundColor,
    // required String leadingRoute,
    // Widget? leadingIcon,
    double? elevation,
    String? title,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      title: Text(
        title ?? '',
        style: AppTextStyles.whiteTextStyle17,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.white,
        ),
      ),
    );
  }

  static AppBar homeAppBar({
    required BuildContext context,
    required String leadingRoute,
    required String actionRoute,
  }) {
    return AppBar(
      title: Text(
        'LOGO',
        style: AppTextStyles.textStyle17,
      ),
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, leadingRoute);
        },
        icon: const Icon(
          Icons.favorite,
          color: AppColors.darkGreen,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, actionRoute);
          },
          icon: SvgPicture.asset('assets/images/ic_person.svg'),
        ),
      ],
    );
  }
}
