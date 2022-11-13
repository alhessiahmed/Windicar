import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:logo/core/routes/routes_names.dart';
import 'package:logo/utils/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushReplacementNamed(context, '/home_screen');
      Navigator.pushReplacementNamed(context, '/on_boarding_screen');
      // Get.toNamed(RoutesNames.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              // Color(0xFF3FD8AC),
              // Color(0xFF0DA7A0),
              // Color(0xFF19B3A2),
              // Color(0xFF28C2A5),
              Color(0xFF35CEA9),
              Color(0xFF14AEA1),
            ],
          ),
        ),
        child: Center(
          child: Text(
            'LOGO',
            style: AppTextStyles.logoTextStyle,
          ),
        ),
      ),
    );
  }
}
