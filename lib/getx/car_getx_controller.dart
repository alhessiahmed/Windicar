import 'package:get/get.dart';
import 'package:logo/model/car_details.dart';

class CarGetxController extends GetxController {
  bool isLoading = false;
  late CarDetails carDetails;


  @override
  void onInit() {
    read();
    super.onInit();
  }

  void read() {
    isLoading = true;
    carDetails = CarDetails(
      city: 'Gaza',
      name: 'Toyota',
      price: 30,
      description: 'HIEMIWNGOWNDOFNWJDFNOWDNFOWJDNOFNWDOFNWO',
      fuelType: FuelType.gasoil,
      carType: CarType.auto,
    );
    isLoading = false;
    update();
  }

  void swapFuel() {
    carDetails.fuelType = (carDetails.fuelType == FuelType.gasoil)
        ? FuelType.essence
        : FuelType.gasoil;
    update();
  }

  void swaptype() {
    carDetails.carType =
        (carDetails.carType == CarType.auto) ? CarType.manuel : CarType.auto;
    update();
  }
}
