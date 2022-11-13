import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logo/getx/home_getx_controller.dart';
import 'package:logo/screens/profiles/app_bar_widget.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';

import '../home_screen.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 320.h,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.favoriteOutline,
                        AppColors.darkGreen,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      getAppBarCustom(
                        title: 'Mark stephane',
                        context: context,
                        colorAppBar: AppColors.white,
                        isVisiableMenu: true,
                      ),
                      CircleAvatar(
                        radius: 33.w,
                        backgroundColor: AppColors.white,
                        backgroundImage: const NetworkImage(
                          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        ),
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Text(
                        'Casablanca',
                        style: AppTextStyles.textTitle14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.yollowStar,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '4.5',
                            style: AppTextStyles.textTitle14.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'membre depuis',
                            style: AppTextStyles.textTitle14.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            DateFormat.yMd().format(DateTime.now()),
                            style: AppTextStyles.textTitle14.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GetBuilder(
                  init: HomeGetxController(),
                  builder: (HomeGetxController controller) {
                    if (controller.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.all(16.r),
                        itemCount: controller.items.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 16.w,
                          childAspectRatio: 166.w / 220.h,
                        ),
                        itemBuilder: (context, index) {
                          return CarCard(
                            id: controller.items[index].id,
                            imgUrl: controller.items[index].imgUrls.first,
                            title: controller.items[index].title,
                            subtitle: controller.items[index].subtitle,
                            rating: controller.items[index].rating,
                            isFav: controller.items[index].isFav,
                            onTap: (() async =>
                                await controller.toggleFavorite(index: index)),
                          );
                        },
                      );
                    }
                  },
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Material(
              color: AppColors.white,
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      child: ElevatedButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.phone),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.cyan,
                        ),
                        onPressed: () {
                          //TODO : Dial
                        },
                        label: Text(
                          'Appeler',
                          style: AppTextStyles.textTitle16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.4,
                      child: ElevatedButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.whatsapp),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenWhatapp,
                        ),
                        onPressed: () {
                          //TODO : whatapp
                        },
                        label: Text(
                          'Whatsapp',
                          style: AppTextStyles.textTitle16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
