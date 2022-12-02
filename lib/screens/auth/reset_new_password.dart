import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/widgets/app_bar_widget.dart';

import '../../widgets/custom_text_form_field.dart';

class ResetNewPasswordScreen extends StatelessWidget {
  const ResetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarCustom(
          title: 'Réinitialiser le nouveau mot de passe', context: context),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hintText: 'Le nouveau mot de passe',
                  isPassword: true,
                ),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hintText: 'Confirmer le mot de passe',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 40.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    //TODO : change password
                  },
                  child: const Text('Réinitialiser'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
