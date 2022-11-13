import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/screens/profiles/app_bar_widget.dart';

import '../profiles/text_form_field_widget.dart';

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
                TextFormFieldCustom(
                  textEditingController: TextEditingController(),
                  hintText: 'Le nouveau mot de passe',
                  textInputType: TextInputType.phone,
                ),
                TextFormFieldCustom(
                  textEditingController: TextEditingController(),
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
