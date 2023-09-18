
import 'dart:convert';
import 'dart:io';

import 'package:foodspeciality/Model/joined_challenge.dart';
import 'package:foodspeciality/Model/search_default_model.dart';
import 'package:foodspeciality/Model/user_data.dart';
import 'package:foodspeciality/Model/user_saved.dart';
import 'package:foodspeciality/screens/completed_challenge.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/completed_challenge.dart';
import '../Model/my_challenge.dart';
import '../Model/search_recipe_model.dart';
import '../Model/user_recipes.dart';
import '../api_common/response_handling.dart';
import '../common files/common_sucess_dailog.dart';
import '../common files/global.dart';
import 'package:http/http.dart' as http;
import '../constants/base_manager.dart';

class SearchPageController extends GetxController{
  SearchDefaultModel? _searchDefaultData;
  SearchDefaultModel? get searchDefaultData => _searchDefaultData;



  // SearchRecipeModel? searchRecipeData;
  

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  SearchRecipeModel? _searchRecipeData;
  SearchRecipeModel? get searchRecipeData => _searchRecipeData;


  bool _isLoadingSearchRecipe = true;
  bool get isLoadingSearchRecipe => _isLoadingSearchRecipe;

  List _textList = []; 
  List get textList => _textList; 

  List _selectTags = [
    {"text": "Quarter to quick", "colorBool": true},
    {"text": "Juicy Mondays", "colorBool": true},
    {"text": "The healthy way", "colorBool": true},
    {"text": "Fry-day!!", "colorBool": true},
    {"text": "Simple greens", "colorBool": true},
    {"text": "Flavour explosions", "colorBool": true},
    {"text": "The healthy way", "colorBool": true},
  ];

  List get selectTags => _selectTags;

  List _southAfricaCuisine = [
    {"text": "Limpopo", "colorBool": true},
    {"text": "Easy", "colorBool": true},
    {"text": "Food", "colorBool": true},
    {"text": "Carrot", "colorBool": true},
    {"text": "Quick", "colorBool": true},
    {"text": "Yoghurt", "colorBool": true},
    {"text": "Breakfast", "colorBool": true},
    {"text": "Quick", "colorBool": true},
    {"text": "Yoghurt", "colorBool": true},
  ];

  List get southAfricaCuisine => _southAfricaCuisine;


  List _internationalCuisine = [
    {"text": "Limpopo", "colorBool": true},
    {"text": "Easy", "colorBool": true},
    {"text": "Food", "colorBool": true},
    {"text": "Carrot", "colorBool": true},
    {"text": "Quick", "colorBool": true},
    {"text": "Yoghurt", "colorBool": true},
    {"text": "Breakfast", "colorBool": true},
    {"text": "Quick", "colorBool": true},
    {"text": "Yoghurt", "colorBool": true},
  ];

  List get internationalCuisine => _internationalCuisine;



  getDefaultSearchData() async {
    try {
      var headers = {
        'x-auth-token': accessToken!
        // 'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImFmYzQ2ZWZhLWI1YWQtNDI2Ny1iZjVmLTRkZWRkNTZjMTYzNiIsImlhdCI6MTY5NDE4MTMzMiwiZXhwIjoxNjk0Nzg2MTMyfQ.dD-ivnkhpbXA67lDqhve0uYET1EJ4OWHjh1zLWMeYag'
      };
      // var request = http.Request('GET', Uri.parse('http://77.68.102.23:8000/recipe-category/quick-search'));
      var request = http.Request('GET', Uri.parse(ApiUrls.getDefaultSearchData));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      // print("getUserProfile");
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
        _searchDefaultData = SearchDefaultModel.fromJson(jsonResp);
        _isLoading = false;
        update();
        // print(_userData);
      }
      else {
        // print(response.reasonPhrase);
        print(response.reasonPhrase);
        _isLoading = false;
        update();
      }

      

    } catch (e) {
      // Get.snackbar("Error", e.toString());
      print(e);
      _isLoading = false;
      update();
    }
  }

  getSearchRecipeData({required String tags, required String difficulty, String searchText = ""}) async {
    try {
      _isLoadingSearchRecipe = true;
      update();
      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getSearchRecipe + searchText));
      request.body = json.encode({
        "tags": tags,
        // [
        //   "Food"
        // ],
        "difficulty": difficulty
        // [
        //   "hard"
        // ]
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      // print("getUserProfile");
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
        // _searchDefaultData = SearchDefaultModel.fromJson(jsonResp);
        // _isLoading = false;
        _searchRecipeData = SearchRecipeModel.fromJson(jsonResp);
        _isLoadingSearchRecipe = false;
        update();
        // print(_userData);
      }
      else {
        // print(response.reasonPhrase);
        print(response.reasonPhrase);
        // _isLoading = false;
        _isLoadingSearchRecipe = false;

        update();
      }

      

    } catch (e) {
      // Get.snackbar("Error", e.toString());
      print(e);
      // _isLoading = false;
      _isLoadingSearchRecipe = false;

      update();
    }
  }


}