import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logo/pref/shared_pref_controller.dart';
import 'package:logo/screens/add_or_update_car.dart';
import 'package:logo/screens/auth/forget_password_screen.dart';
import 'package:logo/screens/auth/login_screen.dart';
import 'package:logo/screens/auth/register_screen.dart';
import 'package:logo/screens/auth/change_password_screen.dart';
import 'package:logo/screens/profile_screen.dart';
import 'package:logo/screens/home_screen.dart';
import 'package:logo/screens/intro/on_boarding_screen.dart';
import 'package:logo/screens/intro/splash_screen.dart';
import 'package:logo/screens/search_screen.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'screens/favorite_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPreferences();
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
            scaffoldBackgroundColor: AppColors.white,
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
          title: 'Windicar',
          routes: {
            '/splash_screen': (context) => const SplashScreen(),
            '/on_boarding_screen': (context) => const OnBoardingScreen(),
            '/home_screen': (context) => const HomeScreen(),
            '/change_password_screen': (context) =>
                const ChangePasswordScreen(),
            '/login_screen': (context) => const LoginScreen(),
            '/forget_password_screen': (context) =>
                const ForgetPasswordScreen(),
            '/register_screen': (context) => const RegisterScreen(),
            '/favorite_screen': (context) => const FavoriteScreen(),
            '/add_or_update_car': (context) => AddOrUpdateCar(),
          },
          // initialRoute: '/favorite_screen',
          initialRoute: '/splash_screen',
          // initialRoute: '/register_screen',
          // initialRoute: '/add_or_update_car',
        );
      },
    );
  }
}
