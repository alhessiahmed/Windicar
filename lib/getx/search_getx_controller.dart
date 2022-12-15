import 'dart:developer';

import 'package:get/get.dart';
import 'package:logo/api/controllers/car_api_controller.dart';
import 'package:logo/api/controllers/favorite_api_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/car.dart';

class SearchGetxController extends GetxController {
  SearchGetxController({
    this.carName,
    this.cityName,
  });

  bool isLoading = false;
  String? carName;
  String? cityName;
  List<Car> cars = [];

  // @override
  // void onInit() async {
  //   await readCars();
  //   super.onInit();
  // }

  Future<void> readCars() async {
    isLoading = true;
    log('++++++++++++');
    log(carName.toString());
    log(cityName.toString());
    log('++++++++++++');
    cars = await CarApiController().searchCars(
      carName: carName,
      cityName: cityName,
    );
    isLoading = false;
    update();
  }

  Future<void> toggleFavorite({
    required int index,
    required bool wasFavorite,
  }) async {
    ApiResponse response = await FavoriteApiController().toggleFavorite(
      id: cars[index].id,
      wasFavorite: wasFavorite,
    );
    print(response.message);
    if (response.success) {
      cars[index].isFavorite = !cars[index].isFavorite;
    }
    update();
  }

  @override
  void onReady() async {
    await readCars();
    super.onReady();
  }
}
