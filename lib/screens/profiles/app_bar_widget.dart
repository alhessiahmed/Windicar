import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      style: TextStyle(
        color: colorAppBar,
        fontSize: 17.sp,
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
            const PopupMenuItem(
              value: PopupMenuItemEnum.edit,
              child: Text("Modifier"),
            ),
            const PopupMenuItem(
              value: PopupMenuItemEnum.logout,
              child: Text("se déconnecter"),
            ),
          ],
        ),
      ),
    ],
  );
}
