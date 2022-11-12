import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/screens/profiles/app_bar_widget.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../profiles/text_form_field_widget.dart';

class RegisterScreen extends StatelessWidget {
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
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 65.h,
              ),
              Text(
                'LOGO',
                style:
                    AppTextStyles.logoTextStyle.copyWith(color: AppColors.grey),
              ),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "S'inscrire en moins d'une minute",
                  style: AppTextStyles.textTitle17,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextFormFieldCustom(
                textEditingController: TextEditingController(),
                hintText: 'Votre nom',
              ),
              TextFormFieldCustom(
                textEditingController: TextEditingController(),
                hintText: 'Votre n° de téléphone',
                textInputType: TextInputType.phone,
              ),
              TextFormFieldCustom(
                textEditingController: TextEditingController(),
                hintText: 'Votre de E-mail',
                textInputType: TextInputType.emailAddress,
              ),
              TextFormFieldCustom(
                textEditingController: TextEditingController(),
                hintText: 'Votre ville',
              ),
              TextFormFieldCustom(
                textEditingController: TextEditingController(),
                hintText: 'Votre mot de passe',
                textInputType: TextInputType.visiblePassword,
                isPassword: true,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("J'ai un compte?"),
                  TextButton(
                    onPressed: () {
                      // TODO:  back to login page
                      Navigator.pop(context);
                    },
                    child: const Text("Se connecter"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
