import 'dart:convert';

import 'package:foodspeciality/Model/blogs_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../common files/global.dart';



class BlogsController extends GetxController {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  BlogsModel? _blogsData;
  BlogsModel? get blogsData => _blogsData;

  getBlogsData() async {
    try {
      // print("getUserProfile");
      var request = http.Request('GET', Uri.parse(ApiUrls.getBlogsData));


      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      // print(resp);
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        _blogsData = BlogsModel.fromJson(jsonResp);
        _isLoading = false;
        final healthy = _blogsData!.data.healthy;
        // _blogsData.data.healthy[0].name
        update();
        // print(resp);
      }
      else {
        print(response.reasonPhrase);
        Get.snackbar("Error", "Something went wrong");
      }

      

    } catch (e) {
      print(e);
      Get.snackbar("Error", "Something went wrong");

      // Get.snackbar("Error", e.toString());
    }
  }
  
  
}