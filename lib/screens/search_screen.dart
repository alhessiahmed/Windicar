import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/car_api_controller.dart';
import 'package:logo/getx/search_getx_controller.dart';
import 'package:logo/model/car.dart';
import 'package:logo/pref/shared_pref_controller.dart';
import 'package:logo/screens/car_details_screen.dart';
import 'package:logo/utils/app_colors.dart';
import 'package:logo/widgets/car_card.dart';

class SearchResultsScreen extends StatelessWidget {
  SearchResultsScreen({
    super.key,
    required this.carName,
    this.cityName,
  });

  final String carName;
  String? cityName;

  @override
  Widget build(BuildContext context) {
    // log(carName.toString());
    // log(cityName.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Résultats de recherche'),
      ),
      body: GetBuilder<SearchGetxController>(
        init: SearchGetxController(
          carName: carName,
          cityName: cityName,
        ),
        builder: (SearchGetxController controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.darkGreen,
                  ),
                )
              : controller.cars.isEmpty
                  ? const Center(
                      child: Text(
                        'Aucun résultat trouvé !',
                        style: TextStyle(
                          fontSize: 32,
                        ),
                      ),
                    )
                  : GridView.builder(
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
                                    index: index, wasFavorite: car.isFavorite);
                              } else {
                                Navigator.pushNamed(context, '/login_screen');
                              }
                            },
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
