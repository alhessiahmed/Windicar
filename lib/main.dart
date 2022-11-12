import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/screens/car_details_screen.dart';
import 'package:logo/screens/home_screen.dart';
import 'package:logo/screens/intro/on_boarding_screen.dart';
import 'package:logo/screens/intro/splash_screen.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: AppColors.darkGreen,
              iconSize: 48.r,
              sizeConstraints: BoxConstraints(
                minWidth: 66.w,
                minHeight: 66.h,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkGreen,
                foregroundColor: AppColors.white,
                textStyle: AppTextStyles.buttonTextStyle,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
                fixedSize: Size(343.w, 50.h),
              ),
            ),
          ),
          title: 'Logo',
          routes: {
            '/splash_screen': (context) => const SplashScreen(),
            '/on_boarding_screen': (context) => const OnBoardingScreen(),
            '/home_screen': (context) => const HomeScreen(),
          },
          initialRoute: '/splash_screen',
        );
      },
    );
  }
}
