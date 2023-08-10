
import 'dart:convert';

import 'package:foodspeciality/Model/recipe_details.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../common files/global.dart';

class ViewRecipeController extends GetxController {
  RecipeDetails? _recipeDetails;
  RecipeDetails? get recipeDetails => _recipeDetails;

  bool _isLoadingRecipeDetails = true;
  bool get isLoadingRecipeDetails=> _isLoadingRecipeDetails;

  getRecipeDetails({required String recipeId}) async {
    try {
      print("getRecipeDetails");
      var headers = {
        'x-auth-token': accessToken!,
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.recipeDetails));
      request.body = json.encode({
        "recipeId": recipeId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      // var headers = {
      //   'x-auth-token': accessToken!
      //   // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY4OTkzOTcxNCwiZXhwIjoxNjkwNTQ0NTE0fQ.T_WbFlhU9tXIoIofyiqzAcyo8tqwyHpuGyl1RpoJq_Y'
      // };
      // var request = http.Request('GET', Uri.parse(ApiUrls.getProfileData));
      // request.body = '''''';
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      // print(resp);
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        _recipeDetails = RecipeDetails.fromJson(jsonResp);
        print(_recipeDetails);

        _isLoadingRecipeDetails = false;
        update();
        // print(_userData);
      }
      else {
        // print(response.reasonPhrase);
        _isLoadingRecipeDetails = false;
        update();
      }

      

    } catch (e) {
      // Get.snackbar("Error", e.toString());
      _isLoadingRecipeDetails = false;
      update();
    }
  }

}