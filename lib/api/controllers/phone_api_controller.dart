import 'dart:convert';

import 'package:logo/api/api_helper.dart';
import 'package:logo/api/api_settings.dart';
import 'package:logo/model/api_response.dart';
import 'package:http/http.dart' as http;

class PhoneApiController with ApiHelper {
  Future<ApiResponse> increaseCallCount(int supplierId) async {
    Uri uri = Uri.parse('${ApiSettings.phone}/$supplierId');
    var response = await http.get(
      uri,
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(
        message: jsonResponse['message'],
        success: jsonResponse['status'],
      );
    }
    return failedResponse;
  }
}
