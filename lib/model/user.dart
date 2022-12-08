import 'package:logo/model/car.dart';

class User {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String password;
  String? callCount;
  String? rate;
  String? imageUrl;
  late int cityId;
  late String createdAt;
  late String updatedAt;
  late String token;
  List<Car> cars = [];
  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    callCount = json['call-count'];
    rate = json['rate'];
    imageUrl = json['image_url'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
    if (json['cars'] != null) {
      json['cars'].forEach((v) {
        cars.add(Car.fromJson(v));
      });
    }
  }
}
