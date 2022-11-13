import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/getx/car_details_getx_controller.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
// import 'package:get/get.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({
    required this.id,
    super.key,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Car ID: $id',
          style: AppTextStyles.cardBlackTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder(
        init: CarDetailsGetxController(),
        builder: (CarDetailsGetxController controller) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 284.h,
                child: Stack(
                  children: [
                    PageView(
                      // controller: controller.pageController,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (int newImgIndex) {
                        controller.updateImgIndex(index: newImgIndex);
                      },
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.fitWidth,
                              // scale: 2,
                              // fit: BoxFit.fitHeight,
                              // fit: BoxFit.fill,
                              // fit: BoxFit.contain,
                              // fit: BoxFit.cover,
                              // fit: BoxFit.scaleDown,
                              image: AssetImage(
                                'assets/images/car_slider.png',
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/car_slider.png',
                          width: 500,
                          height: 500,
                          fit: BoxFit.fitHeight,
                        ),
                        Image.asset(
                          'assets/images/car_slider.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/car_slider.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/car_slider.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 10.5.h,
                      left: (Get.width * 0.5) - 39,
                      child: SizedBox(
                        width: 78.w,
                        height: 11.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              backgroundColor: controller.imgIndex == index
                                  ? AppColors.white
                                  : AppColors.whiteWithOpacity,
                              // backgroundColor: AppColors.whiteWithOpacity,
                              radius: 6.r,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 4.w),
                          itemCount: 5,
                          // itemCount: controller.images.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
