// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/car_api_controller.dart';
import 'package:logo/model/car.dart';
import 'package:logo/model/car_details.dart';

class CarDetailsGetxController extends GetxController {
  CarDetailsGetxController({required this.carId});

  // final PageController pageController = PageController();
  final int carId;
  int imgIndex = 0;
  CarDetails? carDetails;
  bool isLoading = false;

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

  void updateImgIndex({required index}) {
    imgIndex = index;
    update();
  }
}
