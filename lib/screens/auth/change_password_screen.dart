import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/auth_api_controller.dart';
import 'package:logo/getx/auth/change_password_getx_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/utils/helpers.dart';
import 'package:logo/widgets/custom_text_form_field.dart';
import '../../widgets/app_bar_widget.dart';

class ChangePasswordScreen extends StatelessWidget with Helpers {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarCustom(
        title: 'Changer mot de passe',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GetBuilder<ChangePasswordGetxController>(
              init: ChangePasswordGetxController(),
              builder: (ChangePasswordGetxController controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: controller.oldPasswordController,
                        hintText: 'de passe actuel',
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: controller.newPasswordController,
                        hintText: 'Le nouveau mot de passe',
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: controller.confirmPasswordController,
                        hintText: 'Confirmer le mot de passe',
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (controller.formKey.currentState!.validate()) {
                            if (controller.confirmPasswordController.text ==
                                controller.newPasswordController.text) {
                              await _performChangePassword(
                                context: context,
                                newPassword:
                                    controller.newPasswordController.text,
                                oldPassword:
                                    controller.oldPasswordController.text,
                              );
                            } else {
                              showSnackBar(
                                context,
                                message: 'Passwords don\'t match',
                                error: true,
                              );
                            }
                          }
                        },
                        child: const Text('Valider'),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Future<void> _performChangePassword({
    required BuildContext context,
    required String oldPassword,
    required String newPassword,
  }) async {
    ApiResponse response = await AuthApiController().changePassword(
      currentPassword: oldPassword,
      newPassword: newPassword,
    );
    showSnackBar(
      context,
      message: response.message,
      error: !response.success,
    );
    if (response.success) {
      Navigator.pop(context);
    }
  }
}
