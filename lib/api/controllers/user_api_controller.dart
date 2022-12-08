import 'dart:convert';

import 'package:logo/api/api_helper.dart';
import 'package:http/http.dart' as http;
import 'package:logo/api/api_settings.dart';
import 'package:logo/model/user.dart';

class UserApiController with ApiHelper {
  Future<User?> readUserDetails({required int id}) async {
    Uri uri = Uri.parse('${ApiSettings.userDetails}$id');
    var response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return User.fromJson(jsonResponse);
    }
    return null;
  }
}
