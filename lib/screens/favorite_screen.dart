import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logo/getx/favorite_getx_controller.dart';
import 'package:logo/model/car.dart';
import 'package:logo/model/favorite_car.dart';
import 'package:logo/utils/app_text_styles.dart';
import 'package:logo/widgets/app_bar_widget.dart';
import 'package:logo/widgets/car_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarCustom(title: 'Favoris', context: context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<FavoriteGetxController>(
            init: FavoriteGetxController(),
            builder: (FavoriteGetxController controller) {
              if (controller.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (controller.favoriteCars.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.all(16.r),
                      itemCount: controller.favoriteCars.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: 166.w / 220.h,
                      ),
                      itemBuilder: (context, index) {
                        Car car = controller.favoriteCars[index].car;
                        return CarCard(
                          id: car.id,
                          // imgUrl: controller
                          //         .favoriteCars[index].car.images.first,
                          imgUrl:
                              car.images.isNotEmpty ? car.images.first : null,
                          title: car.carName,
                          subtitle: car.price,
                          rating: car.owner.rate.toString(),
                          isFav: true,
                          onTap: (() async =>
                              await controller.deleteFavorite(index: index)),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'You didn\'t add any car to your favorite list',
                      style: AppTextStyles.textStyle17,
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
