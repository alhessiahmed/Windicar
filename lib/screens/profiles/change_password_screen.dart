import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/widgets/custom_text_form_field.dart';
import 'app_bar_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'de passe actuel',
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'Le nouveau mot de passe',
                isPassword: true,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'Confirmer le mot de passe',
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                onPressed: () {
                  //TODO : change password
                },
                child: const Text('Valider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
