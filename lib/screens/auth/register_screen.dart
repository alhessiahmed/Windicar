import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/auth_api_controller.dart';
import 'package:logo/getx/auth/register_getx_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/city.dart';
import 'package:logo/model/user.dart';
import 'package:logo/widgets/app_bar_widget.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/utils/helpers.dart';
import 'package:logo/widgets/custom_text_form_field.dart';
import 'package:logo/widgets/loading_widget.dart';

class RegisterScreen extends StatelessWidget with Helpers {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarCustom(
        title: 'Nouveau compte',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: GetBuilder<RegisterGetxController>(
            init: RegisterGetxController(),
            builder: (RegisterGetxController controller) {
              if (controller.loading) {
                return const LoadingWidget();
              } else if (controller.cities.isNotEmpty) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Windicar',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.logoTextStyle.copyWith(
                          color: AppColors.grey,
                          fontSize: 56,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 8.w),
                        child: Text(
                          "S'inscrire en moins d'une minute",
                          style: AppTextStyles.textStyle17,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomTextFormField(
                        // hasEditIcon: true,
                        controller: controller.nameController,
                        hintText: 'Votre nom',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        // hasEditIcon: true,
                        controller: controller.phoneController,
                        hintText: 'Votre n° de téléphone',
                        isPhone: true,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        // hasEditIcon: true,
                        controller: controller.emailController,
                        hintText: 'Votre de E-mail',
                        isEmail: true,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        height: 50.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: AppColors.sugarWhite,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.17),
                              blurRadius: 3,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: DropdownButton<int>(
                          underline: Container(),
                          isExpanded: true,
                          onChanged: (int? value) {
                            if (value != null) {
                              controller.selectCountry(value);
                            }
                          },
                          value: controller.selectedCountryId,
                          hint: Text(
                            'Votre ville',
                            style: AppTextStyles.textStyle14.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          elevation: 3,
                          style: AppTextStyles.textStyle14,
                          items: controller.cities.map(
                            (City city) {
                              return DropdownMenuItem<int>(
                                value: city.id,
                                child: Text(
                                  city.name,
                                  style: AppTextStyles.textStyle14,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        // hasEditIcon: true,
                        controller: controller.passwordController,
                        hintText: 'Votre mot de passe',
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          _performRegister(controller, context);
                        },
                        child: Text(
                          'Valider',
                          style: AppTextStyles.whiteTextStyle14,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("J'ai un compte?"),
                          TextButton(
                            onPressed: () {
                              // TODO:  back to login page
                              // Navigator.pop(context);
                            },
                            child: const Text("Se connecter"),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'NO DATA',
                    style: AppTextStyles.textStyle17,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _performRegister(
    RegisterGetxController controller,
    BuildContext context,
  ) async {
    if (controller.formKey.currentState!.validate()) {
      if (controller.selectedCountryId != null) {
        User user = User();
        user.name = controller.nameController.text;
        user.phone = controller.phoneController.text;
        user.email = controller.emailController.text;
        user.password = controller.passwordController.text;
        user.cityId = controller.selectedCountryId!;
        ApiResponse response = await AuthApiController().register(user: user);
        if (response.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/login_screen',
            (route) => false,
          );
        }
        showSnackBar(
          context,
          message: response.message,
          error: !response.success,
        );
      }
    }
  }
}
