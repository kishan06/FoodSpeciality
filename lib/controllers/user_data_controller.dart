
import 'dart:convert';
import 'dart:io';

import 'package:foodspeciality/Model/user_data.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../api_common/response_handling.dart';
import '../common files/global.dart';
import 'package:http/http.dart' as http;
import '../constants/base_manager.dart';

class UserDataController extends GetxController{
  UserData? _userData;
  UserData? get userData => _userData;
  
  getUserProfile() async {
    try {
      print("getUserProfile");
      var headers = {
        'x-auth-token': accessToken!
        // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY4OTkzOTcxNCwiZXhwIjoxNjkwNTQ0NTE0fQ.T_WbFlhU9tXIoIofyiqzAcyo8tqwyHpuGyl1RpoJq_Y'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getProfileData));
      request.body = '''''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }

      // print("calling signInUser");
      // var headers = {
      //   'Content-Type': 'application/json'
      // };
      // var request = http.Request('POST', Uri.parse(ApiUrls.forgotPassword));
      // request.body = json.encode({
      //   "email_address": email
      // });
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      


      // var resp = await response.stream.bytesToString();
      // print(resp);
      // var jsonResp = jsonDecode(resp);
      // if (response.statusCode == 200) {
      //   var id = jsonResp["id"];
      //   Get.toNamed("/otpverification",
      //     arguments: <String>[id,email]
      //   );
      //   // Get.offAll("bh");
        
      // } else if(response.statusCode == 404) {
      //   Get.snackbar("Error", jsonResp["message"]);
      // }
      // else {
      //   Get.snackbar("Error", response.reasonPhrase!);

      //   // print(response.reasonPhrase);
      // }

    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  
}