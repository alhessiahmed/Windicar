import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/utils/app_text_styles.dart';

enum PopupMenuItemEnum {
  edit,
  logout,
}

AppBar getAppBarCustom({
  required String title,
  required BuildContext context,
  Color colorAppBar = Colors.black,
  bool isVisiableMenu = false,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
        // TODO : BACK ICON
      },
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: colorAppBar,
      ),
    ),
    title: Text(
      title,
      style: AppTextStyles.textTitle17.copyWith(
        color: colorAppBar,
      ),
    ),
    centerTitle: true,
    actions: [
      Visibility(
        visible: isVisiableMenu,
        child: PopupMenuButton<PopupMenuItemEnum>(
          icon: Icon(
            Icons.more_vert,
            color: colorAppBar,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: PopupMenuItemEnum.edit,
              child: Text(
                "Modifier",
                style: AppTextStyles.textTitle17,
              ),
            ),
            PopupMenuItem(
              value: PopupMenuItemEnum.logout,
              child: Text(
                "se déconnecter",
                style: AppTextStyles.textTitle17,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
