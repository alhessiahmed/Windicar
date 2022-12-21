import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:logo/api/api_helper.dart';
import 'package:logo/api/api_settings.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/car.dart';
import 'package:http/http.dart' as http;
import 'package:logo/model/car_details.dart';
import 'package:logo/pref/shared_pref_controller.dart';

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

  Future<List<String>> readCitiesNames() async {
    List<String> citiesNames = [];
    Uri uri = Uri.parse(ApiSettings.cityNames);
    var response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var list = jsonResponse['data'] as List;
      for (var element in list) {
        citiesNames.add(element['name']);
      }
    }
    return citiesNames;
  }

  Future<List<String>> readCarsNames() async {
    List<String> carsNames = [];
    Uri uri = Uri.parse(ApiSettings.carNames);
    var response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var list = jsonResponse['data'] as List;
      for (var element in list) {
        carsNames.add(element['car_name']);
      }
    }
    return carsNames;
  }

  Future<CarDetails?> getCarDetails({required int id}) async {
    Uri uri = Uri.parse('${ApiSettings.car}/$id');
    var response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return CarDetails.fromJson(jsonResponse['data']);
    }
    return null;
  }

  Future<ApiResponse> addCar({
    required int cityId,
    required String carName,
    required String price,
    required String description,
    required bool fuelIsEssence,
    required bool typeIsManuel,
    required List<XFile> images,
  }) async {
    Uri uri = Uri.parse(ApiSettings.car);
    var request = http.MultipartRequest('POST', uri);
    request.headers[HttpHeaders.authorizationHeader] =
        SharedPrefController().token;
    request.headers[HttpHeaders.acceptHeader] = 'application/json';

    // for (var xFile in images) {
    //   var file = await http.MultipartFile.fromPath('car_image', xFile.path);
    //   request.files.add(file);
    // }

    // for (int i = 0; i < images.length; i++) {
    //   String path = images[i].path;
    //   request.files.addAll(
    //     [
    //       await http.MultipartFile.fromPath('car_image', path)
    //       // MapEntry("car_image", await MultipartFile.fromFile(path, filename: path))
    //     ],
    //   );
    // }

    // List<MultipartFile> files = images
    //     .map(
    //       (XFile file) => MultipartFile(
    //         file.path,
    //         filename: file.path,
    //       ),
    //     )
    //     .toList();

    // request.files.addAll(
    //   images.map(
    //     (XFile file) async => await http.MultipartFile.fromPath(
    //       'car_image',
    //       file.path,
    //     ),
    //   ),
    // );

    // var file =
    //     await http.MultipartFile.fromPath('car_image', images.first.path);
    // request.files.add(file);

    request.fields['car_name'] = carName;
    request.fields['price'] = price;
    request.fields['fuel_type'] = fuelIsEssence ? 'Essence' : 'Gasoil';
    request.fields['car_type'] = typeIsManuel ? 'Manuel' : 'Automatique';
    request.fields['description'] = description;
    request.fields['city_id'] = cityId.toString();
    // request.fields['car_image'] = files;

    List<http.MultipartFile> files = [];
    for (XFile file in images) {
      var f = await http.MultipartFile.fromPath('car_image[]', file.path);
      files.add(f);
    }
    request.files.addAll(files);

    var response = await request.send();
    // print('-------------- ${response.statusCode} --------------');
    if (response.statusCode == 201 ||
        response.statusCode == 400 ||
        response.statusCode == 401) {
      var body = await response.stream.transform(utf8.decoder).first;
      var jsonResponse = jsonDecode(body);
      // print('--------------$jsonResponse--------------');
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> updateCar({
    required int carId,
    required int cityId,
    required String carName,
    required String price,
    required String description,
    required bool fuelIsEssence,
    required bool typeIsManuel,
    List<XFile>? images,
  }) async {
    Uri uri = Uri.parse('${ApiSettings.car}/$carId');
    var request = http.MultipartRequest('POST', uri);
    request.headers[HttpHeaders.authorizationHeader] =
        SharedPrefController().token;
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    request.fields['car_name'] = carName;
    request.fields['price'] = price;
    request.fields['fuel_type'] = fuelIsEssence ? 'Essence' : 'Gasoil';
    request.fields['car_type'] = typeIsManuel ? 'Manuel' : 'Automatique';
    request.fields['description'] = description;
    request.fields['city_id'] = cityId.toString();
    request.fields['_method'] = 'put';
    if (images != null) {
      List<http.MultipartFile> files = [];
      for (XFile file in images) {
        var f = await http.MultipartFile.fromPath('car_image[]', file.path);
        files.add(f);
      }
      request.files.addAll(files);
    }
    var response = await request.send();
    // print('-------------- ${response.statusCode} --------------');
    if (response.statusCode == 201 ||
        response.statusCode == 400 ||
        response.statusCode == 401) {
      var body = await response.stream.transform(utf8.decoder).first;
      var jsonResponse = jsonDecode(body);
      // print('--------------$jsonResponse--------------');
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
    } else if (response.statusCode == 404) {
      return ApiResponse(
        message: 'This car doesn\'t exist',
        success: false,
      );
    } else {
      return failedResponse;
    }
  }

  Future<List<Car>> searchCars({
    required String carName,
    String? cityName,
  }) async {
    List<Car> cars = [];
    Uri uri = Uri.parse(ApiSettings.filter);
    // log('----------');
    // log(carName.toString());
    // log(cityName.toString());
    // log((carName != null && cityName != null).toString());
    // log((carName != null && cityName == null).toString());
    final map = carName.isNotEmpty && cityName != null
        ? {
            'car': carName,
            'city': cityName,
          }
        : carName.isNotEmpty && cityName == null
            ? {
                'car': carName,
              }
            : {
                'city': cityName,
              };
    // log(map.toString());
    // log('----------');
    var response = await http.post(
      uri,
      headers: {
        'Accept': 'application/json',
      },
      body: map,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var list = jsonResponse['data'] as List;
      cars = list.map((e) => Car.fromJson(e)).toList();
    }
    return cars;
  }
}
