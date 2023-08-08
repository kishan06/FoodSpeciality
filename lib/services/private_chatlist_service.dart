import 'dart:convert';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;
import 'package:foodspeciality/Model/PrivateChatListModel.dart';

class PrivateChatListService {
  final String apiUrl = ApiUrls.privatechatlist;

  Future<PrivateChatListModel> getPrivateChatListData(String authToken) async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'x-auth-token': "$accessToken",
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return PrivateChatListModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
