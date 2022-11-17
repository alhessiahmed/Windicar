import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/screens/auth/login_screen.dart';
import 'package:logo/screens/auth/register_screen.dart';
import 'package:logo/screens/auth/verification_screen.dart';
import 'package:logo/screens/profiles/change_password_screen.dart';
// import 'package:logo/screens/profiles/profile_screen.dart';
import 'package:logo/screens/profile_screen.dart';
import 'package:logo/screens/home_screen.dart';
import 'package:logo/screens/intro/on_boarding_screen.dart';
import 'package:logo/screens/intro/splash_screen.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

import 'screens/auth/reset_new_password.dart';
import 'screens/favorite/favorite_screen.dart';
import 'screens/supplier/supplier_screen.dart';

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
        // return GetMaterialApp(
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: const ColorScheme.light().copyWith(
              primary: AppColors.darkGreen,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: AppColors.darkGreen,
              foregroundColor: AppColors.white,
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
                textStyle: AppTextStyles.textStyle14,
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
            '/profile_screen': (context) => const ProfileScreen(),
            '/change_password_screen': (context) =>
                const ChangePasswordScreen(),
            '/login_screen': (context) => const LoginScreen(),
            '/register_screen': (context) => const RegisterScreen(),
            '/verification_screen': (context) => const VerificationScreen(),
            '/reset_new_password_screen': (context) =>
                const ResetNewPasswordScreen(),
            '/favorite_screen': (context) => const FavoriteScreen(),
            '/supplier_screen': (context) => const SupplierScreen(),
          },
          // initialRoute: '/profile_screen',
          // initialRoute: '/favorite_screen',
          initialRoute: '/splash_screen',
          // initialRoute: '/supplier_screen',
          // getPages: AppRoutes.getPage(),
          // initialRoute: RoutesNames.splashScreen,
        );
      },
    );
  }
}
