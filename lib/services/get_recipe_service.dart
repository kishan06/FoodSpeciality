import 'dart:convert';
import 'package:foodspeciality/Model/RecipeModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

class GetRecipeService {
  final String apiUrl = ApiUrls.getrecipe;

  Future<RecipeModel> getRecipeData() async {
    try {
      print("getRecipeData");
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return RecipeModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
