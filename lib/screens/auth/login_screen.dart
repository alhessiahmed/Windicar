import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/auth_api_controller.dart';
import 'package:logo/getx/auth/login_getx_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/utils/app_bars.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/utils/helpers.dart';
import 'package:logo/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget with Helpers {
  const LoginScreen({super.key});

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
          child: GetBuilder<LoginGetxController>(
              init: LoginGetxController(),
              builder: (LoginGetxController controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
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
                        height: 80.h,
                      ),
                      CustomTextFormField(
                        controller: controller.emailController,
                        hintText: 'Votre de E-mail',
                        isEmail: true,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: controller.passwordController,
                        hintText: 'Votre mot de passe',
                        isPassword: true,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/change_password_screen');
                          },
                          child: const Text('Mot de passe oublié ?'),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ElevatedButton(
                        onPressed: () async =>
                            await _performLogin(controller, context),
                        child: const Text('Valider'),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register_screen');
                        },
                        child: const Text("S'inscrire gratuitement"),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Future<void> _performLogin(
      LoginGetxController controller, BuildContext context) async {
    if (controller.formKey.currentState!.validate()) {
      ApiResponse response = await AuthApiController().login(
        email: controller.emailController.text,
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
    }
  }
}
