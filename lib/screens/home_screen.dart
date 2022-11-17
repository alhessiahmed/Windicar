import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/getx/home_getx_controller.dart';
import 'package:logo/screens/car_details_screen.dart';
import 'package:logo/utils/app_bars.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/widgets/car_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBars.homeAppBar(
        context: context,
        leadingRoute: '/favorite_screen',
        actionRoute: '/profile_screen',
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: Text('data'),
                ),
                const Expanded(
                  flex: 2,
                  child: Text('00'),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
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
                return Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
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
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
