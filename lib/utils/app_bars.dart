import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logo/pref/shared_pref_controller.dart';
import 'package:logo/screens/profile_screen.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

class AppBars {
  static AppBar customAppBar({
    required BuildContext context,
    required Color backgroundColor,
    // required String leadingRoute,
    // Widget? leadingIcon,
    Color? iconColor,
    double? elevation,
    String? title,
    TextStyle? titleStyle,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      title: Text(
        title ?? '',
        style: titleStyle ?? AppTextStyles.whiteTextStyle17,
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: iconColor ?? AppColors.white,
        ),
      ),
    );
  }

  static AppBar homeAppBar({required BuildContext context}) {
    return AppBar(
      title: Text(
        'Windicar',
        style: AppTextStyles.textStyle17,
      ),
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          String route = SharedPrefController().loggedIn
              ? '/favorite_screen'
              : '/login_screen';
          Navigator.pushNamed(context, route);
        },
        icon: const Icon(
          Icons.favorite,
          color: AppColors.darkGreen,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            SharedPrefController().loggedIn
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        userId: SharedPrefController()
                            .getByKey(key: PrefKeys.id.name),
                      ),
                    ))
                : Navigator.pushNamed(context, '/login_screen');
          },
          icon: SvgPicture.asset('assets/images/ic_person.svg'),
        ),
      ],
    );
  }
}
