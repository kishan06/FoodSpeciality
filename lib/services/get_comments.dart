import 'dart:convert';
import 'package:foodspeciality/Model/RecipeModel.dart';
import 'package:foodspeciality/Model/comments_model.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Comments? comments;

class GetCommentsController extends GetxController {
  // final String apiUrl = ApiUrls.getrecipe;

  Comments? _comments;
  Comments? get comments => _comments;

  emptyComments(){
    _comments = null;
  }

  Future<Comments> getCommentsData(String recipeId) async {
    try {
      var headers = {
        'x-auth-token': accessToken!,
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getComments));
      request.body = json.encode({
        "recipeId": recipeId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var resp = await response.stream.bytesToString();


      if (response.statusCode == 200) {
        final jsonResponse = json.decode(resp);

        _comments = Comments.fromJson(jsonResponse);
        update();
        return comments!;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  addCommentApi({required String commment, required String recipeId}) async {
    try {
      var headers = {
        'x-auth-token': accessToken!,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(ApiUrls.addComments));
      request.body = json.encode({
        "comment": commment,
        "recipeId": recipeId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        getCommentsData(recipeId);
      }
      else {
        print(response.reasonPhrase);
        Get.snackbar("Error", "Something went wrong");
      }
    } catch (e) {
      // Get.snackbar("Error", e.toString());
      Get.snackbar("Error", "Something went wrong");

    }
  }

  likeCommentApi({required String commentId, required String recipeId}) async {
    try {
      print(likeCommentApi);
      var headers = {
        'x-auth-token': accessToken!,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(ApiUrls.likeComment));
      request.body = json.encode({
        "commentId": commentId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        getCommentsData(recipeId);

      }
      else {
        // print(response.reasonPhrase);
        // Get.snackbar("Error", response.reasonPhrase.toString());
        Get.snackbar("Error", "Something went wrong");

      }

    } catch (e) {
      // Get.snackbar("Error", e.toString());
      Get.snackbar("Error", "Something went wrong");

    }
  }

}
