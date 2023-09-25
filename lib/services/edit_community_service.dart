import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

class EditCommunityService {
  static Future editCommunity(
      String communityId, String name, String description, String image) async {
    final apiUrl = ApiUrls.updatecommunity;
    final body = {
      "communityId": communityId,
      "name": name,
      "description": description,
      "image": image
    };

    try {
      print(body);
      var headers = {'x-auth-token': '$accessToken'};
      var request = http.MultipartRequest('PUT', Uri.parse(apiUrl));
      request.fields.addAll({
        "communityId": communityId,
        'name': name,
        'description': description
      });
      request.files
          .add(await http.MultipartFile.fromPath('profile_image', image));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        //     final jsonResponse = json.decode(response.body);
        // print("resp from api ${jsonResponse["message"]}");
        // return jsonResponse["success"];\
        print(await response.stream.bytesToString());
        return true;
      } else {
        print(response.reasonPhrase);
      }

      // if (response.statusCode == 200) {
      //   // final jsonResponse = json.decode(response.body);
      //   // print("resp from api ${jsonResponse["message"]}");
      //   // return jsonResponse["success"];
      // } else {
      //   // API call failed
      //   throw Exception('Failed to update community');
      // }
    } catch (e) {
      // Error occurred while making the API call
      throw Exception('Error: $e');
    }
  }
}
