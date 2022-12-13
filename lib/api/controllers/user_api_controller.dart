import 'dart:convert';
import 'dart:io';

import 'package:logo/api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:logo/api/api_settings.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/user.dart';
import 'package:logo/pref/shared_pref_controller.dart';

class UserApiController with ApiHelper {
  Future<User?> readUserDetails({required int id}) async {
    Uri uri = Uri.parse('${ApiSettings.userDetails}$id');
    var response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return User.fromJson(jsonResponse['data']);
    }
    return null;
  }

  Future<ApiResponse> updateUserProfile({
    String? imgPath,
    required String name,
    required String mobile,
    required String cityId,
  }) async {
    Uri uri = Uri.parse(ApiSettings.updateUserProfile);
    var request = http.MultipartRequest('POST', uri);
    // request.headers = headers; // This can't be done because headers is final and don't have a setter method (ya khsara).
    request.headers[HttpHeaders.authorizationHeader] =
        SharedPrefController().token;
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
    if (imgPath != null) {
      var file = await http.MultipartFile.fromPath('image', imgPath);
      request.files.add(file);
    }

    request.fields['name'] = name;
    request.fields['email'] = cityId;
    request.fields['phone'] = mobile;
    request.fields['_method'] = 'put';
    var response = await request.send();
    print('-------------- ${response.statusCode} --------------');
    if (response.statusCode == 200 ||
        response.statusCode == 400 ||
        response.statusCode == 401) {
      var body = await response.stream.transform(utf8.decoder).first;
      var jsonResponse = jsonDecode(body);
      print('--------------$jsonResponse--------------');
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }
}
