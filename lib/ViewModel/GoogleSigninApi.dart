import 'dart:convert';

import 'package:foodspeciality/api_common/network_api.dart';
import 'package:foodspeciality/constants/base_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common files/global.dart';

class GoogleSigninApi {
  GoogleSigninApi();

  Future<ResponseData<dynamic>> googleSigninApi(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response =
        await NetworkApi().postApiDio(data, ApiUrls.storeGoogleSigninDetails);

    if (response.status == ResponseStatus.SUCCESS) {
      print("google api resp is $response");

      await prefs.setString(
          'accessToken', response.data["data"]["accessToken"]);
      await prefs.setString(
          'refreshToken', response.data["data"]["refreshToken"]);
      accessToken = response.data["data"]["accessToken"];

      // print(await response.stream.bytesToString());
    } else {
      return ResponseData<dynamic>(
          response.data['message'], ResponseStatus.FAILED);
    }
    return response;
  }

  Future<ResponseData<dynamic>> googleSigninCheckToken(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response =
        await NetworkApi().postApiDio(data, ApiUrls.loginWithGoogleSignin);

    if (response.status == ResponseStatus.SUCCESS) {
      print("google api resp is $response");
      if (response.data['success'] == true) {
        await prefs.setString(
            'accessToken', response.data["data"]["accessToken"]);
        await prefs.setString(
            'refreshToken', response.data["data"]["refreshToken"]);
        accessToken = response.data["data"]["accessToken"];
      } else {
        return ResponseData<dynamic>(
            response.data['message'], ResponseStatus.PRIVATE);
      }

      // print(await response.stream.bytesToString());
    } else {
      return ResponseData<dynamic>(
          response.data['message'], ResponseStatus.FAILED);
    }
    return response;
  }
}
