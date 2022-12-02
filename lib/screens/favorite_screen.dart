import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logo/screens/home_screen.dart';
import 'package:logo/widgets/app_bar_widget.dart';
import 'package:logo/widgets/car_card.dart';
import '../getx/favorite_screen_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarCustom(title: 'Favoris', context: context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder(
            init: FavoriteScreenController(),
            builder: (FavoriteScreenController controller) {
              if (controller.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: GridView.builder(
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
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
