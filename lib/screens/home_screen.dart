import 'package:dropdown_search/dropdown_search.dart';
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
import 'package:logo/utils/helpers.dart';
import 'package:logo/widgets/car_card.dart';
import 'package:logo/widgets/custom_floating_button.dart';
import 'package:logo/widgets/custom_text_form_field.dart';
import 'package:logo/widgets/drop_down_widget.dart';

class HomeScreen extends StatelessWidget with Helpers {
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
          // return Text('Test');
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBars.homeAppBar(
              context: context,
              onReturn: () => controller.readCars(),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                await controller.readCars();
              },
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomTextFormField(
                          controller: controller.nameController,
                          hintText: 'Voiture',
                          suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                          noValidation: true,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (String value) {
                            if (controller.nameController.text
                                    .trim()
                                    .isNotEmpty ||
                                controller.selectedCityName != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchResultsScreen(
                                    carName:
                                        controller.nameController.text.trim(),
                                    cityName: controller.selectedCityName,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        // DropDownWidget(
                        //   hintText: "Voiture",
                        //   items: controller.carsNames,
                        //   onChanged: (String? carName) {
                        //     if (carName != null) {
                        //       controller.changeSelectedCarName(carName);
                        //     }
                        //   },
                        // ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        flex: 5,
                        child:
                            // CustomTextFormField(
                            //   controller: controller.cityController,
                            //   hintText: 'Ville',
                            //   suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                            // ),
                            DropDownWidget(
                          hintText: "Ville",
                          items: controller.citiesNames,
                          // onDelete: () {
                          //   controller.changeSelectedCityName(null);
                          // },
                          onChanged: (String? city) {
                            // if (city != null) {
                            controller.changeSelectedCityName(city);
                            // }
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
                          child: InkWell(
                            onTap: () {
                              // if (controller.selectedCarName != null ||
                              //     controller.selectedCityName != null) {
                              if (controller.nameController.text
                                      .trim()
                                      .isNotEmpty ||
                                  // controller.cityController.text
                                  //     .trim()
                                  //     .isNotEmpty
                                  controller.selectedCityName != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchResultsScreen(
                                      carName:
                                          controller.nameController.text.trim(),
                                      cityName: controller.selectedCityName,
                                      // controller.cityController.text.trim(),
                                    ),
                                  ),
                                );
                              } else {
                                /// TODO : SHOW SNACK BAR
                                // getDeleteDialog(context: context);
                              }
                            },
                            child: Icon(
                              Icons.search,
                              // size: 24.r,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 16.r),
                    itemCount: controller.cars.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 166.w / 232.h,
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
                ],
              ),
            ),
            floatingActionButton: const CustomFloatingButton(isHome: true),
          );
        }
      },
    );
  }
}
