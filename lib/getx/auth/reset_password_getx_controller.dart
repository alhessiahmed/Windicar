import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordGetxController extends GetxController {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
}
