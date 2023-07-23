
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
  UserData? userData;

  Future<ResponseData<dynamic>> getProfileData() async {
    print("addRecipe");
    try {
      var headers = {
        'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY4OTkzOTcxNCwiZXhwIjoxNjkwNTQ0NTE0fQ.T_WbFlhU9tXIoIofyiqzAcyo8tqwyHpuGyl1RpoJq_Y'
      };
      var request = http.Request('GET', Uri.parse('http://77.68.102.23:8000/user/profile'));
      request.body = '''''';
      request.headers.addAll(headers);



      http.StreamedResponse response = await request.send();

      // return responseHandling(response: response);


      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // //   return ResponseData<dynamic>(
      // //   // jsonResp["message"],
      // //   // e.toString(),
      // //   "fgh",
      // //   ResponseStatus.FAILED,
      // // );
      // }
      // else {
      //   print(response.reasonPhrase);
      //   // return ResponseData<dynamic>(
      //   // // jsonResp["message"],
      //   // // e.toString(),
      //   // "fgh",
      //   // ResponseStatus.FAILED,
      //   // );
      // }
      
      // return responseHandling(response: response);
      var resp = await response.stream.bytesToString();
      // print(resp);
      var jsonResp = jsonDecode(resp);

      switch (response.statusCode) {
      case 200:
        // onSuccess();
        // return 
        return ResponseData<dynamic>(
          // "success",
          jsonResp["message"],
          ResponseStatus.SUCCESS,
          
        );

        // break;

      case 403:
        return ResponseData<dynamic>(
          "UnAuthorized",
          ResponseStatus.PRIVATE,
          // data: 
        );
        // break;
      case 400:
        // Get.showSnackbar(snackbar)
        Get.snackbar(
          "Error", jsonResp["message"]
        );
                      
        return ResponseData<dynamic>(
          "UnAuthorized",
          ResponseStatus.FAILED,
          // data: 
        );
        // break;
      default:
      // ret
        return ResponseData<dynamic>(
          "Default",
          ResponseStatus.FAILED,
          // data: 
        );
    }


      
      

    } catch (e) {
      Get.snackbar("Error", e.toString());
      return ResponseData<dynamic>(
        e.toString(),
        ResponseStatus.FAILED,
      );
    }
  }

}