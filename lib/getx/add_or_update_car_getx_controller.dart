import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logo/api/controllers/city_api_controller.dart';
import 'package:logo/model/city.dart';

class AddOrUpdateCarGetxController extends GetxController {
  AddOrUpdateCarGetxController({
    this.oldName,
    this.oldCityId,
    this.oldDescription,
    this.oldPrice,
    this.wasEssence,
    this.wasManuel,
  });

  String? oldName;
  String? oldPrice;
  String? oldDescription;
  int? oldCityId;
  bool? wasEssence;
  bool? wasManuel;

  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;

  final formKey = GlobalKey<FormState>();

  late bool fuelFirstButtonIsSelected;
  late bool carFirstButtonIsSelected;

  List<XFile> images = [];
  late ImagePicker imagePicker = ImagePicker();

  int? selectedCountryId;
  List<City> cities = [];
  bool loading = false;

  @override
  void onInit() async {
    nameController = TextEditingController(text: oldName);
    priceController = TextEditingController(text: oldPrice);
    descriptionController = TextEditingController(text: oldDescription);
    fuelFirstButtonIsSelected = wasEssence ?? false;
    carFirstButtonIsSelected = wasManuel ?? false;
    selectedCountryId = oldCityId;
    await read();
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

  Future<void> pickImages() async {
    images = await imagePicker.pickMultiImage(
      imageQuality: 70,
    );
    update();
  }

  void toggleFuelButton(bool firstIsSelected) {
    fuelFirstButtonIsSelected = firstIsSelected;
    update();
  }

  void toggleCarStyleButton(bool firstIsSelected) {
    carFirstButtonIsSelected = firstIsSelected;
    update();
  }
}
