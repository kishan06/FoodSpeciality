
import 'dart:convert';
import 'dart:io';

import 'package:foodspeciality/Model/joined_challenge.dart';
import 'package:foodspeciality/Model/search_default_model.dart';
import 'package:foodspeciality/Model/user_data.dart';
import 'package:foodspeciality/Model/user_saved.dart';
import 'package:foodspeciality/screens/completed_challenge.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/community_search.dart';
import '../Model/completed_challenge.dart';
import '../Model/default_community_search.dart';
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

  DefaultCommunitySearch? _defaultCommunitySearch;
  DefaultCommunitySearch? get defaultCommunitySearch => _defaultCommunitySearch;

  bool _loadingDefaultCommunitySearch = false;
  bool get loadingDefaultCommunitySearch => _loadingDefaultCommunitySearch;
  
  bool _isLoadingSearchRecipe = true;
  bool get isLoadingSearchRecipe => _isLoadingSearchRecipe;

  List _textList = []; 
  List get textList => _textList; 

  bool _editChip = false;
  bool get editChip => _editChip;

  bool _textFieldVisibile = false;
  bool get textFieldVisibile => _textFieldVisibile;

  CommunitySearch? _communitySearch;
  CommunitySearch? get communitySearch => _communitySearch;
  
  bool _loadingSearchCommunity = false;
  bool get loadingSearchCommunity => _loadingSearchCommunity;



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

  addTags(String value){
    _textList.add(value);
    update();
  }

  removeTags(String value){
    _textList.remove(value);
    update();
  }

  updateEditChip(){
    _editChip = !editChip;
    update();
  }

  updateTextfieldVisible(bool value){
    // _editChip = !editChip;
    _textFieldVisibile = value;
    update();
  }

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

  getSearchRecipeData({required List tags, required String difficulty, String searchText = ""}) async {
    try {
      _isLoadingSearchRecipe = true;
      update();
      List difficultyList = [];
      if (difficulty != "") {
        difficultyList.add(difficulty);
      }

      var headers = {
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getSearchRecipe + searchText));
      print(tags);
      request.body = json.encode({
        "tags": tags,
        "difficulty": difficultyList
      });
      print(request.body);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      // print(jsonResp);

      if (response.statusCode == 200) {
        var resp = await response.stream.bytesToString();
        // print(resp);
        var jsonResp = jsonDecode(resp);
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

  getDefaultCommunitySearch() async {
    try {
      var headers = {
        'x-auth-token': accessToken!
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getDefaultCommunitySearch));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      var jsonResp = jsonDecode(resp);
      print(jsonResp);

      if (response.statusCode == 200) {
        _defaultCommunitySearch = DefaultCommunitySearch.fromJson(jsonResp);
        // _searchDefaultData = SearchDefaultModel.fromJson(jsonResp);
        _loadingDefaultCommunitySearch = false;
        update();
      }
      else {
        print(response.reasonPhrase);
        _loadingDefaultCommunitySearch = false;
        update();
      }

      

    } catch (e) {
      print(e);
      _loadingDefaultCommunitySearch = false;
      update();
    }
  }


  getSearchCommunityData({String searchText = ""}) async {
    try {
      _loadingSearchCommunity = true;
      update();
      // List difficultyList = [];
      // if (difficulty != "") {
      //   difficultyList.add(difficulty);
      // }

      // var request = http.Request('GET', Uri.parse('http://77.68.102.23:8000/community/searchCommunity?search='));

      // var headers = {
      //   'Content-Type': 'application/json'
      // };
      var request = http.Request('GET', Uri.parse(ApiUrls.getCommunitySearch + searchText));
      // print(tags);
      // request.body = json.encode({
      //   "tags": tags,
      //   "difficulty": difficultyList
      // });
      // print(request.body);
      // request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      // print(jsonResp);

      if (response.statusCode == 200) {
        var resp = await response.stream.bytesToString();
        // print(resp);
        var jsonResp = jsonDecode(resp);
        _communitySearch = CommunitySearch.fromJson(jsonResp);
        _loadingSearchCommunity = false;
        // _searchRecipeData = SearchRecipeModel.fromJson(jsonResp);
        // _isLoadingSearchRecipe = false;
        update();
        // print(_userData);
      }
      else {
        // print(response.reasonPhrase);
        print(response.reasonPhrase);
        // _isLoading = false;
        // _isLoadingSearchRecipe = false;
        _loadingSearchCommunity = false;


        update();
      }

      

    } catch (e) {
      // Get.snackbar("Error", e.toString());
      print(e);
      // _isLoading = false;
      // _isLoadingSearchRecipe = false;
      _loadingSearchCommunity = false;


      update();
    }
  }



}