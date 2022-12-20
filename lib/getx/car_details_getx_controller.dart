// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/car_api_controller.dart';
import 'package:logo/api/controllers/favorite_api_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/car.dart';
import 'package:logo/model/car_details.dart';

class CarDetailsGetxController extends GetxController {
  CarDetailsGetxController({required this.carId});

  // final PageController pageController = PageController();
  final int carId;
  int imgIndex = 0;
  CarDetails? carDetails;
  bool isLoading = false;
  bool favStatusGotUpdated = false;

  @override
  void onInit() async {
    await readCarDetails();
    super.onInit();
  }

  Future<void> readCarDetails() async {
    isLoading = true;
    carDetails = await CarApiController().getCarDetails(id: carId);
    isLoading = false;
    update();
  }

  void toggleFavorite() async {
    if (carDetails != null) {
      ApiResponse response = await FavoriteApiController().toggleFavorite(
        id: carDetails!.car.id,
        wasFavorite: carDetails!.car.isFavorite,
      );
      if (response.success) {
        carDetails!.car.isFavorite = !carDetails!.car.isFavorite;
        favStatusGotUpdated = !favStatusGotUpdated;
        update();
      }
    }
  }

  void updateImgIndex({required index}) {
    imgIndex = index;
    update();
  }
}
