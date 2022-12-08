import 'dart:convert';

import 'package:logo/api/api_helper.dart';
import 'package:logo/api/api_settings.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/car.dart';
import 'package:http/http.dart' as http;

class CarApiController with ApiHelper {
  Future<List<Car>> readCars() async {
    List<Car> cars = [];
    Uri uri = Uri.parse(ApiSettings.car);
    var response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var list = jsonResponse['data'] as List;
      cars = list.map((e) => Car.fromJson(e)).toList();
    }
    return cars;
  }

  Future<Car?> getCarDetails({required int id}) async {
    Uri uri = Uri.parse('${ApiSettings.car}/$id');
    var response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return Car.fromJson(jsonResponse['data']);
    }
    return null;
  }

  Future<ApiResponse> addCar({required Car car}) async {
    Uri uri = Uri.parse(ApiSettings.car);
    var response = await http.post(
      uri,
      headers: headers,
      body: {
        'car_name': car.carName,
        'price': car.price,
        'fuel_type': car.fueltype,
        'car_type': car.cartype,
        'description': car.description,
        'city_id': car.cityId,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> updateCar({required Car car}) async {
    Uri uri = Uri.parse(ApiSettings.car);
    var response = await http.put(
      uri,
      headers: headers,
      body: {
        'car_name': car.carName,
        'price': car.price,
        'fuel_type': car.fueltype,
        'car_type': car.cartype,
        'description': car.description,
        'city_id': car.cityId,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> deleteCar({required int id}) async {
    Uri uri = Uri.parse('${ApiSettings.car}/$id');
    var response = await http.delete(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    } else if (response.statusCode == 400) {
      return ApiResponse(
        message: 'This car doesn\'t exist',
        success: false,
      );
    } else {
      return failedResponse;
    }
  }
}
