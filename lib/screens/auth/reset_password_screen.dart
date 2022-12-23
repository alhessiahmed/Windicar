import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/auth_api_controller.dart';
import 'package:logo/getx/auth/reset_password_getx_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/utils/helpers.dart';
import 'package:logo/widgets/app_bar_widget.dart';
import 'package:logo/widgets/custom_text_form_field.dart';

class ResetPasswordScreen extends StatelessWidget with Helpers {
  const ResetPasswordScreen({required this.email, super.key});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarCustom(
          title: 'Réinitialiser le nouveau mot de passe', context: context),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GetBuilder<ResetPasswordGetxController>(
                init: ResetPasswordGetxController(),
                builder: (ResetPasswordGetxController controller) {
                  return Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomTextFormField(
                          controller: controller.codeController,
                          hintText: 'Entrez le code',
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomTextFormField(
                          controller: controller.passwordController,
                          hintText: 'Le nouveau mot de passe',
                          obscureText: controller.newPasswordIsVisible,
                          suffixIcon: InkWell(
                            onTap: () =>
                                controller.toggleNewPasswordVisibility(),
                            child: controller.newPasswordIsVisible
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
                          ),
                          isPassword: true,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomTextFormField(
                          controller: controller.confirmPasswordController,
                          hintText: 'Confirmer le mot de passe',
                          obscureText: controller.confirmPasswordIsVisible,
                          suffixIcon: InkWell(
                            onTap: () =>
                                controller.toggleConfirmPasswordVisibility(),
                            child: controller.confirmPasswordIsVisible
                                ? const Icon(Icons.visibility_outlined)
                                : const Icon(Icons.visibility_off_outlined),
                          ),
                          isPassword: true,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _performReset(controller, context);
                          },
                          child: const Text('Réinitialiser'),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  Future<void> _performReset(
      ResetPasswordGetxController controller, BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      if (controller.passwordController.text ==
          controller.confirmPasswordController.text) {
        ApiResponse response = await AuthApiController().resetPassword(
          email: email,
          code: controller.codeController.text,
          password: controller.passwordController.text,
        );
        showSnackBar(
          context,
          message: response.message,
          error: !response.success,
        );
        if (response.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home_screen',
            (route) => false,
          );
        }
      } else {
        showSnackBar(
          context,
          message: 'les mots de passe ne correspondent pas',
          error: true,
        );
      }
    }
  }
}
