import 'dart:convert';

import 'package:foodspeciality/Model/blogs_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../Model/notification_model.dart';
import '../common files/global.dart';



class NotificationController extends GetxController {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  // BlogsModel? _blogsData;
  // BlogsModel? get blogsData => _blogsData;
  // NotificationMo
  // NotificationMo
  NotificationModel? _notificationData;
  NotificationModel? get notificationData => _notificationData;
  

  getNotificationData() async {
    try {
      // print("getUserProfile");
      // var request = http.Request('GET', Uri.parse(ApiUrls.getBlogsData));
      var headers = {
        'x-auth-token': accessToken!,

        // 'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQxYzc0Y2FiLTMyMGQtNDU0OS1iZTIwLWY0ZTVmYzA1YTkyMiIsImlhdCI6MTY5NTU1MDQxNywiZXhwIjoxNjk2MTU1MjE3fQ.ojJNQfRlet9cfZNgMDFDjHiEh45q-EOyFkY18jG39gE',
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getNotification));
      request.body = json.encode({
        "seen": true
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      // print(resp);
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        _notificationData = NotificationModel.fromJson(jsonResp);
        _isLoading = false;
        update();
      }
      else {
        print(response.reasonPhrase);
        _isLoading = false;
        update();
      }
    } catch (e) {
      print(e);
      _isLoading = false;
      update();
    }
  }
}