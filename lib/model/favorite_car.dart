import 'package:logo/model/car.dart';

class FavoriteCar {
  late int id;
  late int ownerId;
  late int carId;
  late String createdAt;
  late String updatedAt;
  late Car car;
  // late Owner owner;

  FavoriteCar();

  FavoriteCar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    carId = json['car_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    car = Car.fromJson(json['car']);
    // owner = Owner.fromJson(json['owner']);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['owner_id'] = this.ownerId;
  //   data['car_id'] = this.carId;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.car != null) {
  //     data['car'] = this.car.toJson();
  //   }
  //   return data;
  // }
}
