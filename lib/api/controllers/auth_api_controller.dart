import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logo/api/api_helper.dart';
import 'package:logo/api/api_settings.dart';
import 'package:logo/model/api_response.dart';
import 'package:logo/model/user.dart';
import 'package:logo/pref/shared_pref_controller.dart';

class AuthApiController with ApiHelper {
  Future<ApiResponse> register({required User user}) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(
      uri,
      body: {
        'name': user.name,
        'phone': user.phone,
        'email': user.email,
        'city_id': user.cityId,
        'password': user.password,
      },
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> login({
    required String phone,
    required String password,
  }) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(
      uri,
      body: {
        'phone': phone,
        'password': password,
      },
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var jsonObject = jsonResponse['data'];
        User user = User.fromJson(jsonObject);
        await SharedPrefController().save(user: user);
      }
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> logout() async {
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode == 401) {
      await SharedPrefController().logout();
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: response.statusCode == 200
            ? jsonResponse['message']
            : 'Logged out successfully',
        success: true,
      );
    }
    return failedResponse;
  }

  Future<ApiResponse> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    Uri uri = Uri.parse(ApiSettings.changePassword);
    var response = await http.post(
      uri,
      headers: headers,
    );
    var jsonResponse = jsonDecode(response.body);
    return ApiResponse(
      message: jsonResponse['message'],
      success: jsonResponse['status'],
    );
  }

  Future<ApiResponse> forgotPassword({required String email}) async {
    Uri uri = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(
      uri,
      body: {
        'email': email,
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

  Future<ApiResponse> resetPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    Uri uri = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(uri, body: {
      'email': email,
      'code': code,
      'new_password': password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }
}
