import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginGetxController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool passwordIsVisible = true;
  void togglePasswordVisibility() {
    passwordIsVisible = !passwordIsVisible;
    update();
  }
}
