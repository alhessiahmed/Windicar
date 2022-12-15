import 'dart:developer';

import 'package:logo/model/car_image.dart';
import 'package:logo/model/city.dart';
import 'package:logo/model/owner.dart';

class Car {
  late int id;
  late int ownerId;
  late String carName;
  late String price;
  late String fueltype;
  late String cartype;
  late String description;
  late int cityId;
  late String createdAt;
  late String updatedAt;
  late bool isFavorite;
  Owner? owner;
  late List<CarImage> images = [];
  City? city;

  Car();

  Car.fromJson(Map<String, dynamic> json) {
    log(json.toString() + "\n\n\n\n");
    id = json['id'];
    ownerId = json['owner_id'];
    carName = json['car_name'];
    price = json['price'];
    fueltype = json['fueltype'];
    cartype = json['cartype'];
    description = json['description'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isFavorite = json['is_favorite'];
    if (json['owner'] != null) {
      owner = Owner.fromJson(json['owner']);
    }
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(CarImage.fromJson(v));
      });
    }
    if (json['city'] != null) {
      city = City.fromJson(json['city']);
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['owner_id'] = this.ownerId;
  //   data['car_name'] = this.carName;
  //   data['price'] = this.price;
  //   data['fueltype'] = this.fueltype;
  //   data['cartype'] = this.cartype;
  //   data['description'] = this.description;
  //   data['city_id'] = this.cityId;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.images != null) {
  //     data['images'] = this.images.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
