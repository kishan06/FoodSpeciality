import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_common/network_api.dart';
import '../common files/global.dart';
import '../constants/base_manager.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  Future<ResponseData<dynamic>> addRecipe({
    required String videoPath,
    required String imagePath,
  }) async {
    try {
      var headers = {
        'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ0Y2Y4ZWY0LTA2NzItNDY0MC1hZjU3LTgzM2RhYzFjNjQyZSIsImlhdCI6MTY4NzMzNTI0NiwiZXhwIjoxNjg3MzM1ODQ2fQ.oVaE23jFdF4pmQZQs1ydoRk60i0TOcOZAhUnkjC5V5U'
      };
      var request = http.MultipartRequest('POST', Uri.parse(ApiUrls.addRecipe));
      request.fields.addAll({
        'name': 'biryani',
        'description': 'chicken rice',
        'difficulty': 'hard',
        'cooking_time': '30',
        'servings': '1'
      });
      request.files.add(await http.MultipartFile.fromPath('video', videoPath));
      request.files.add(await http.MultipartFile.fromPath('cover_image', imagePath));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      print(resp);
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }

      // var headers = {
      //   'Content-Type': 'application/json'
      // };
      // var request = http.Request('POST', Uri.parse(ApiUrls.login));
      // request.body = json.encode({
      //   "email": email,
      //   "password": password
      // });
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      // var resp = await response.stream.bytesToString();
      // print(resp);
      // var jsonResp = jsonDecode(resp);
      if (response.statusCode == 200) {
        return ResponseData<dynamic>(
          "success",
          ResponseStatus.SUCCESS,
        );
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // print("token " + jsonResp["data"]["accessToken"]);
        // await prefs.setString('accessToken', jsonResp["data"]["accessToken"]);
        // await prefs.setString('refreshToken', jsonResp["data"]["refreshToken"]);

        // // print(await response.stream.bytesToString());
        // Get.toNamed("/bottomBar");

      } else if(response.statusCode == 400) {
        return ResponseData<dynamic>(
        jsonResp["message"],
          ResponseStatus.FAILED,
        );
        // Get.snackbar("Error", jsonResp["data"]["message"]);
      }
      else {
        return ResponseData<dynamic>(
          jsonResp["message"],
          ResponseStatus.FAILED,
        );
        // Get.snackbar("Error", response.reasonPhrase!);

        // print(response.reasonPhrase);
      }

    } catch (e) {
      return ResponseData<dynamic>(
        // jsonResp["message"],
        e.toString(),
        ResponseStatus.FAILED,
      );
      // Get.snackbar("Error", e.toString());
    }
  }

}