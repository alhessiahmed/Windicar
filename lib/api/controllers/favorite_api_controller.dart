import 'dart:convert';

import 'package:logo/api/api_helper.dart';
import 'package:logo/api/api_settings.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/favorite_car.dart';
import 'package:http/http.dart' as http;

class FavoriteApiController with ApiHelper {
  Future<List<FavoriteCar>> readFavoriteCars() async {
    List<FavoriteCar> favoriteCars = [];
    Uri uri = Uri.parse(ApiSettings.favorite);
    var response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var list = jsonResponse['data'] as List;
      if (list.isNotEmpty) {
        favoriteCars = list.map((e) => FavoriteCar.fromJson(e)).toList();
      }
    }
    return favoriteCars;
  }

  Future<ApiResponse> toggleFavorite(
      {required int id, required bool wasFavorite}) async {
    Uri uri = wasFavorite
        ? Uri.parse('${ApiSettings.favorite}/$id')
        : Uri.parse(ApiSettings.favorite);

    var response = wasFavorite
        ? await http.delete(
            uri,
            headers: headers,
          )
        : await http.post(
            uri,
            headers: headers,
            body: {
              'car_id': id.toString(),
            },
          );
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }
}
