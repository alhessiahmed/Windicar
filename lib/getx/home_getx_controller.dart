import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/car_api_controller.dart';
import 'package:logo/api/controllers/favorite_api_controller.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/car.dart';

class HomeGetxController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;
  List<Car> cars = [];
  List<String> carsNames = [];
  List<String> citiesNames = [];
  String? selectedCityName;
  String? selectedCarName;

  @override
  void onInit() async {
    await readCars();
    super.onInit();
  }

  void changeSelectedCityName(String? city) {
    selectedCityName = city;
    update();
  }

  void changeSelectedCarName(String car) {
    selectedCarName = car;
    update();
  }

  Future<void> readNames() async {
    carsNames = await CarApiController().readCarsNames();
    update();
  }

  Future<void> readCities() async {
    citiesNames = await CarApiController().readCitiesNames();
    update();
  }

  Future<void> readCars() async {
    isLoading = true;
    cars = await CarApiController().readCars();
    // await readNames();
    await readCities();
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

  // Future<ApiResponse> addCar({required Car car}) async {

  // }
}
