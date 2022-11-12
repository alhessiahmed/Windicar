import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

import '../profiles/text_form_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 55.h,
              ),
              Text(
                'Se connecter',
                style: AppTextStyles.textTitle17,
              ),
              SizedBox(
                height: 80.h,
              ),
              Text(
                'LOGO',
                style:
                    AppTextStyles.logoTextStyle.copyWith(color: AppColors.grey),
              ),
              SizedBox(
                height: 80.h,
              ),
              TextFormFieldCustom(
                textEditingController: TextEditingController(),
                hintText: 'Votre n° de téléphone',
                textInputType: TextInputType.phone,
              ),
              TextFormFieldCustom(
                textEditingController: TextEditingController(),
                hintText: 'Votre mot de passe',
                textInputType: TextInputType.visiblePassword,
                isPassword: true,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/change_password_screen');
                  },
                  child: const Text('Mot de passe oublié ?'),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Valider'),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextButton(
                onPressed: () {
                  // TODO:  Go to register page
                },
                child: const Text("S'inscrire gratuitement"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
