import 'package:logo/model/car.dart';
import 'package:logo/model/city.dart';

class User {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String password;
  String? callCount;
  String? searchCount;
  String? rate;
  String? imageUrl;
  late int cityId;
  late String createdAt;
  late String updatedAt;
  late String token;
  List<Car> cars = [];
  City? city;
  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    callCount = json['call_count'];
    searchCount = json['search_count'];
    rate = json['rate'];
    imageUrl = json['image_url'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['token'] != null) {
      token = json['token'];
    }
    if (json['city'] != null) {
      city = City.fromJson(json['city']);
    }
    if (json['cars'] != null) {
      json['cars'].forEach((v) {
        cars.add(Car.fromJson(v));
      });
    }
  }
}
