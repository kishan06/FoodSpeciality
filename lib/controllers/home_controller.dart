// import 'dart:convert';

// import 'package:foodspeciality/common%20files/global.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;


// class HomeController extends GetxController {
//   int? _notificationCount;
//   int? get notificationCount => _notificationCount; 

//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   getNotificationCount() async {
//     try {
//       var headers = {
//         'x-auth-token': accessToken!,
//         // 'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYzA1NTZjLWViYTYtNDU1ZS1iZGIyLTc4ZTM3Nzk4YzA1YiIsImlhdCI6MTY5NTMwNzYxMiwiZXhwIjoxNjk1OTEyNDEyfQ._8gDn546-y6L1nOK0143l8UMxlMZkU7Acp3HBeejJ7s',
//         'Content-Type': 'application/json'
//       };
//       var request = http.Request('GET', Uri.parse('http://77.68.102.23:8000/user/notification'));
//       request.body = json.encode({
//         "seen": false
//       });
//       request.headers.addAll(headers);

//       http.StreamedResponse response = await request.send();

//       if (response.statusCode == 200) {
//         // print(await response.stream.bytesToString());
//         var resp = await response.stream.bytesToString();
//         var jsonResp = jsonDecode(resp);
//         print(jsonResp);
        
//       }
//       else {
//         print(response.reasonPhrase);
//       }

//     } catch (e) {
      
//     }
//   }
// }