import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/getx/home_getx_controller.dart';
import 'package:logo/model/car.dart';
import 'package:logo/pref/shared_pref_controller.dart';
import 'package:logo/utils/app_bars.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/widgets/car_card.dart';
import 'package:logo/widgets/custom_floating_button.dart';
import 'package:logo/widgets/custom_text_form_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBars.homeAppBar(
        context: context,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    hintText: 'Voiture',
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 3,
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    hintText: 'Ville',
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    backgroundColor: AppColors.darkGreen,
                    foregroundColor: AppColors.white,
                    radius: 19.r,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<HomeGetxController>(
            init: HomeGetxController(),
            builder: (HomeGetxController controller) {
              if (controller.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // print('------ ${controller.cars.length} ------');
                return Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16.r),
                    itemCount: controller.cars.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 166.w / 224.h,
                    ),
                    itemBuilder: (context, index) {
                      Car car = controller.cars[index];

                      return CarCard(
                        id: car.id,
                        imgUrl: car.images.isNotEmpty ? car.images.first : null,
                        title: car.carName,
                        subtitle: car.price,
                        rating: car.owner?.rate.toString() ?? '0',
                        isFav: SharedPrefController().loggedIn
                            ? car.isFavorite
                            : false,
                        onTap: () async {
                          if (SharedPrefController().loggedIn) {
                            await controller.toggleFavorite(
                                index: index, wasFavorite: car.isFavorite);
                          } else {
                            Navigator.pushNamed(context, '/login_screen');
                          }
                        },
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}
