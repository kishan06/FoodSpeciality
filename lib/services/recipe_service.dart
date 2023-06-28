import 'dart:convert';

import 'package:foodspeciality/api_common/response_handling.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_common/network_api.dart';
import '../common files/global.dart';
import '../constants/base_manager.dart';
import 'package:http/http.dart' as http;

import '../controllers/recipe_ingre_controller.dart';

class RecipeService {

  RecipeIngreController recipeIngreController = Get.put(RecipeIngreController());

  Future<ResponseData<dynamic>> addRecipe({
    required String videoPath,
    required String imagePath,
    required String name,
    required String description,
    required String difficulty,
    required String cookingTime,
    required String serving,
    required String tags,
    required String ingredients
  }) async {
    print("addRecipe");
    try {
      var headers = {
        'x-auth-token': accessToken!
        // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBkYTBkMDRlLTRmYzUtNGQ0Mi05ZGVkLTBkMDM4NDhmMzhlNSIsImlhdCI6MTY4Nzk1MDYyMSwiZXhwIjoxNjg3OTUxMjIxfQ.4tNkxPbi8A6Eso39ObosnQLSVMJ_WRupY5URe9_CjEk'
      };
      var request = http.MultipartRequest('POST', Uri.parse('http://foodspeciality.betadelivery.com:8000/recipe/create'));
      request.fields.addAll({
        'name': name,
        'description': description,
        'difficulty': difficulty,
        'cooking_time': cookingTime,
        'servings': serving,
        'tags': tags,
        'ingredients': ingredients
        // '[{"name": "rice", "quantity": "1 cup"}, {"name": "chicken", "quantity": "100 gm"}]'
      });
      request.files.add(await http.MultipartFile.fromPath('video', videoPath));
      request.files.add(await http.MultipartFile.fromPath('cover_image', imagePath));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      return responseHandling(response: response);
      // var resp = await response.stream.bytesToString();
      // print(resp);
      // var jsonResp = jsonDecode(resp);
      // print(resp.sta)
      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // }
      // else {
      //   print(response.reasonPhrase);
      // }


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
      // if (response.statusCode == 200) {
      //   return ResponseData<dynamic>(
      //     "success",
      //     ResponseStatus.SUCCESS,
      //   );
      //   // SharedPreferences prefs = await SharedPreferences.getInstance();
      //   // print("token " + jsonResp["data"]["accessToken"]);
      //   // await prefs.setString('accessToken', jsonResp["data"]["accessToken"]);
      //   // await prefs.setString('refreshToken', jsonResp["data"]["refreshToken"]);

      //   // // print(await response.stream.bytesToString());
      //   // Get.toNamed("/bottomBar");

      // } else if(response.statusCode == 400) {
      //   return ResponseData<dynamic>(
      //   jsonResp["message"],
      //     ResponseStatus.FAILED,
      //   );
      //   // Get.snackbar("Error", jsonResp["data"]["message"]);
      // }
      // else {
      //   return ResponseData<dynamic>(
      //     jsonResp["message"],
      //     ResponseStatus.FAILED,
      //   );
      //   // Get.snackbar("Error", response.reasonPhrase!);

      //   // print(response.reasonPhrase);
      // }

    } catch (e) {
      // Get.
      Get.snackbar("Error", e.toString());
      return ResponseData<dynamic>(
        // jsonResp["message"],
        e.toString(),
        ResponseStatus.FAILED,
      );
      // Get.snackbar("Error", e.toString());
    }
  }

}