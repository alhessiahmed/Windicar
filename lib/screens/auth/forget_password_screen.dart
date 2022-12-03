import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/auth_api_controller.dart';
import 'package:logo/getx/auth/forget_password_getx_controller.dart';
import 'package:logo/getx/auth/login_getx_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/screens/auth/reset_password_screen.dart';
import 'package:logo/utils/app_bars.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/utils/helpers.dart';
import 'package:logo/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget with Helpers {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.customAppBar(
        backgroundColor: AppColors.white,
        context: context,
        elevation: 0,
        iconColor: AppColors.black,
        title: 'Se connecter',
        titleStyle: AppTextStyles.textStyle17,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GetBuilder<ForgetPasswordGetxController>(
              init: ForgetPasswordGetxController(),
              builder: (ForgetPasswordGetxController controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 55.h,
                      ),
                      Text(
                        'Windicar',
                        style: AppTextStyles.logoTextStyle.copyWith(
                          color: AppColors.grey,
                          fontSize: 56,
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'Récupérer le de mot de passe ',
                        style: AppTextStyles.textStyle17,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        'Indiquez votre de E-mail pour  récuperer votre mot passe',
                        style: AppTextStyles.textStyle16,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomTextFormField(
                        controller: controller.emailController,
                        hintText: 'Votre de E-mail',
                        isEmail: true,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ElevatedButton(
                        onPressed: () async =>
                            await _resetPassword(controller, context),
                        child: const Text('Envoyer'),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Future<void> _resetPassword(
      ForgetPasswordGetxController controller, BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      ApiResponse response = await AuthApiController().forgotPassword(
        email: controller.emailController.text,
      );
      showSnackBar(
        context,
        message: response.message,
        error: !response.success,
      );
      if (response.success) {
        // Navigator.pushReplacementNamed(context, '/reset_password_screen');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResetPasswordScreen(email: controller.emailController.text),
          ),
        );
      }
    }
  }
}
