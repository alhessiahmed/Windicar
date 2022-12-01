import 'dart:convert';

import 'package:logo/api/api_helper.dart';
import 'package:logo/api/api_settings.dart';
import 'package:logo/model/city.dart';
import 'package:http/http.dart' as http;

class CityApiController with ApiHelper {
  Future<List<City>> readCities() async {
    List<City> cities = [];
    Uri uri = Uri.parse(ApiSettings.city);
    var response = await http.get(
      uri,
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var list = jsonResponse['data'] as List;
      cities = list.map((e) => City.fromJson(e)).toList();
    }
    return cities;
  }
}
