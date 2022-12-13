import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logo/api/controllers/user_api_controller.dart';
import 'package:logo/getx/profile_getx_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/helpers.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/custom_text_form_field.dart';

class UpdateProfileScreen extends StatelessWidget with Helpers {
  UpdateProfileScreen({
    super.key,
    this.imgUrl,
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
  });

  final int userId;
  final String name;
  final String mobile;
  final String email;
  String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarCustom(
        title: name,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GetBuilder<ProfileGetxController>(
              init: ProfileGetxController(
                emailContent: email,
                mobileContent: mobile,
                nameContent: name,
              ),
              builder: (ProfileGetxController controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      SizedBox.square(
                        dimension: 120.r,
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 60.w,
                              backgroundColor: AppColors.darkGreen,
                              child: CircleAvatar(
                                radius: 50.w,
                                backgroundColor: AppColors.white,
                                backgroundImage: controller.imageIsUpdated
                                    ? FileImage(
                                        File(
                                          controller.pickedImage!.path,
                                        ),
                                      )
                                    : imgUrl != null
                                        ? NetworkImage(imgUrl!)
                                        : const AssetImage(
                                                'assets/images/avatar.jpg')
                                            as ImageProvider,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: AppColors.darkGreen,
                                radius: 16.w,
                                child: CircleAvatar(
                                  radius: 12.w,
                                  backgroundColor: AppColors.white,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () async {
                                      await controller
                                          .pickImageFrom(ImageSource.gallery);
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 15,
                                      color: AppColors.darkGreen,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: controller.nameController,
                        // controllerContent: name,
                        hintText: 'appeler',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: controller.mobileController,
                        // controllerContent: mobile,
                        hintText: 'téléphone',
                        isPhone: true,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFormField(
                        controller: controller.emailController,
                        // controllerContent: email,
                        hintText: 'Casablanca',
                        textInputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/change_password_screen');
                        },
                        child: Text('Changer mot de passe'),
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          ApiResponse response =
                              await UserApiController().updateUserProfile(
                            imgPath: controller.pickedImage?.path,
                            name: controller.nameController.text,
                            mobile: controller.mobileController.text,
                            cityId: controller.emailController.text,
                          );
                          showSnackBar(
                            context,
                            message: response.message,
                            error: !response.success,
                          );
                          if (response.success) {
                            Navigator.pop(context);
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

  // Future<void> _performUpdate(
  //     ProfileGetxController controller, BuildContext context) async {
  //   if (controller.formKey.currentState!.validate()) {
  //     ApiResponse response = await AuthApiController().login(
  //       email: controller.emailController.text,
  //       password: controller.passwordController.text,
  //     );
  //     showSnackBar(
  //       context,
  //       message: response.message,
  //       error: !response.success,
  //     );
  //     if (response.success) {
  //       Navigator.pushNamedAndRemoveUntil(
  //         context,
  //         '/home_screen',
  //         (route) => false,
  //       );
  //     }
  //   }
  // }

}
