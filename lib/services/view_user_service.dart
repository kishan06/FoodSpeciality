import 'package:foodspeciality/Model/ViewUserModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewUserService {
  final String apiUrl = ApiUrls.viewuser;

  Future<ViewUserModel> fetchUserProfile(String userId) async {
    try {
      final headers = {'x-auth-token': accessToken!};
      final body = {'id': userId};

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return ViewUserModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
