import 'package:logo/model/car.dart';

class CarDetails {
  late Car car;
  late List<Car> similarCars = [];

  CarDetails();

  CarDetails.fromJson(Map<String, dynamic> json) {
    car = Car.fromJson(json['car']);
    if (json['sameCars'] != null) {
      json['sameCars'].forEach((v) {
        similarCars.add(Car.fromJson(v));
      });
    }
  }
}
