import '../common files/global.dart';

import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/screens/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void createCommunity(
    String accessToken, List selectedIds, String name, String desp) async {
  const String apiUrl = ApiUrls.createCommunity;

  final Map<String, dynamic> requestBody = {
    "name": name,
    "description": desp,
    "members": selectedIds.map((id) => id.toString()).toList(),
  };

  final headers = {
    'x-auth-token': accessToken,
    'Content-Type': 'application/json',
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      // Request successful, do something with the response
      print('Community created successfully');
      Get.to(() => BottomBar(
            selectedIndex: 3,
          ));
      print(response.body);
    } else {
      // Request failed, handle the error
      print('Failed to create community. Error: ${response.statusCode}');
    }
  } catch (error) {
    // Exception occurred during the request
    print('Error creating community: $error');
  }
}
