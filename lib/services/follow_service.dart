import 'dart:convert';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

class FollowService {
  static Future followRecipe(String userId) async {
    print("followRecipe");
    final apiUrl = ApiUrls.follow;
    final body = {"userId": userId};

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: body,
        headers: {'x-auth-token': "$accessToken"},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("resp from api ${jsonResponse["message"]}");
        return jsonResponse["success"];
      } else {
        // API call failed
        throw Exception('Failed to follow user');
      }
    } catch (e) {
      // Error occurred while making the API call
      throw Exception('Error: $e');
    }
  }

  static Future<bool> removeFollower(String userId) async {
    // print("followRecipe");
    // final apiUrl = ApiUrls.follow;
    // final body = {"userId": userId};

    try {
      var headers = {
      'x-auth-token': accessToken!,
        // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjdkNzU3MjM1LTJhMDQtNDVmMC1iYzUyLTJmMDQ1MWU3Nzc0YSIsImlhdCI6MTY5MjY5NzM5MywiZXhwIjoxNjkzMzAyMTkzfQ.UUryEooOQ4IhMOEOQ1Z16MoAm2XKzFLOKxsSxTqaOKs',
        'Content-Type': 'application/json'
      };
      var request = http.Request('DELETE', Uri.parse(ApiUrls.removeFollower));
      request.body = json.encode({
        "id": userId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      // if (response.statusCode == 200) {
      //   print(await response.stcream.bytesToString());
      // }
      // else {
      //   print(response.reasonPhrase);
      // }


      if (response.statusCode == 200) {
        // print(await response.stcream.bytesToString());
        print(await response.stream.bytesToString());
        
        // final jsonResponse = json.decode(response.body);
        // print("resp from api ${jsonResponse["message"]}");
        // return jsonResponse["success"];
        return true;
      } else {
        // API call failed
        print(response.reasonPhrase);
        throw Exception('Failed to follow user');

      }
    } catch (e) {
      // Error occurred while making the API call
      throw Exception('Error: $e');
    }
  }

}
