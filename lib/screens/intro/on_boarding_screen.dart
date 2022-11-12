import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/utils/app_text_styles.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 59.h),
            Text(
              'LOGO',
              style: AppTextStyles.onBoardingAppBarTextStyle,
            ),
            SizedBox(height: 66.h),
            Image.asset('assets/images/entre.png'),
            SizedBox(height: 48.h),
            Text(
              'Vous souhaitez louer votre voiture préférée ?\nBienvenue vous êtes au bon endroit',
              style: AppTextStyles.onBoardingTextStyle,
            ),
            SizedBox(height: 14.h),
            Text(
              'هل ترغب بتأجير سيارتك المفضلة\nمرحبا بك أنت في المكان المناسب',
              style: AppTextStyles.onBoardingTextStyle,
            ),
            SizedBox(height: 50.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home_screen');
              },
              child: const Text('Entrée'),
            ),
          ],
        ),
      ),
    );
  }
}
