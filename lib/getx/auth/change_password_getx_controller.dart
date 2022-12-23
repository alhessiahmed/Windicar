import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordGetxController extends GetxController {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool oldPasswordIsVisible = true;
  void toggleOldPasswordVisibility() {
    oldPasswordIsVisible = !oldPasswordIsVisible;
    update();
  }

  bool newPasswordIsVisible = true;
  void toggleNewPasswordVisibility() {
    newPasswordIsVisible = !newPasswordIsVisible;
    update();
  }

  bool confirmPasswordIsVisible = true;
  void toggleConfirmPasswordVisibility() {
    confirmPasswordIsVisible = !confirmPasswordIsVisible;
    update();
  }
}
