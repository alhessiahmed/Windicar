import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logo/api/controllers/city_api_controller.dart';
import 'package:logo/model/city.dart';

class RegisterGetxController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int? selectedCountryId;
  List<City> cities = [];
  bool loading = false;

  bool passwordIsVisible = true;
  void togglePasswordVisibility() {
    passwordIsVisible = !passwordIsVisible;
    update();
  }

  @override
  void onInit() {
    read();
    super.onInit();
  }

  Future<void> read() async {
    loading = true;
    cities = await CityApiController().readCities();
    loading = false;
    update();
  }

  void selectCountry(int id) {
    selectedCountryId = id;
    update();
  }

  final formKey = GlobalKey<FormState>();
}
