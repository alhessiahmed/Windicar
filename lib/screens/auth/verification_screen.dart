import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/widgets/app_bar_widget.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/widgets/custom_text_form_field.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarCustom(
        title: 'Mon compte',
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
              Text(
                "Récupérer le de mot de passe",
                style: AppTextStyles.textStyle17,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Indiquez votre de E-mail pour récuperer\n votre mot passe",
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle17,
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'Votre de E-mail',
               isEmail: true,
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                onPressed: () {
                  //TODO : GO TO RESET NEW PASSWORD PAGE
                  Navigator.pushNamed(context, '/reset_new_password_screen');
                },
                child: const Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
