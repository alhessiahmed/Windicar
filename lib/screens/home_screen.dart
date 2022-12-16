import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/getx/home_getx_controller.dart';
import 'package:logo/model/car.dart';
import 'package:logo/pref/shared_pref_controller.dart';
import 'package:logo/screens/car_details_screen.dart';
import 'package:logo/screens/search_screen.dart';
import 'package:logo/utils/app_bars.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/widgets/car_card.dart';
import 'package:logo/widgets/custom_floating_button.dart';
import 'package:logo/widgets/drop_down_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeGetxController>(
      init: HomeGetxController(),
      builder: (HomeGetxController controller) {
        if (controller.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBars.homeAppBar(
              context: context,
              onReturn: () => controller.readCars(),
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
                        child: DropDownWidget(
                          hintText: "Voiture",
                          items: controller.carsNames,
                          onChanged: (String? carName) {
                            if (carName != null) {
                              controller.changeSelectedCarName(carName);
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        flex: 3,
                        child: DropDownWidget(
                          hintText: "Ville",
                          items: controller.citiesNames,
                          onChanged: (String? city) {
                            if (city != null) {
                              controller.changeSelectedCityName(city);
                            }
                          },
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
                            onPressed: () {
                              if (controller.selectedCarName != null ||
                                  controller.selectedCityName != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchResultsScreen(
                                      carName: controller.selectedCarName,
                                      cityName: controller.selectedCityName,
                                    ),
                                  ),
                                );
                              } else {
                                /// TODO : SHOW SNACK BAR
                              }
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
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
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarDetailsScreen(
                                id: car.id,
                                isFav: SharedPrefController().loggedIn
                                    ? car.isFavorite
                                    : false,
                              ),
                            ),
                          ).then((value) => controller.readCars());
                        },
                        child: CarCard(
                          id: car.id,
                          imgUrl: car.images.isNotEmpty
                              ? car.images.first.imageUrl
                              : null,
                          title: car.carName,
                          subtitle: car.price,
                          rating: car.owner?.rate.toString() ?? '0',
                          isFav: SharedPrefController().loggedIn
                              ? car.isFavorite
                              : false,
                          // initialRoute: '/home_screen',
                          onTap: () async {
                            if (SharedPrefController().loggedIn) {
                              await controller.toggleFavorite(
                                index: index,
                                wasFavorite: car.isFavorite,
                              );
                            } else {
                              Navigator.pushNamed(context, '/login_screen');
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            floatingActionButton: const CustomFloatingButton(),
          );
        }
      },
    );
  }
}
