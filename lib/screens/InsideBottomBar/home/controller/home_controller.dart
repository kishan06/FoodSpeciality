import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../common files/global.dart';

class HomeController extends GetxController {
  // _currentIndex
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  int? _notificationCount;
  int? get notificationCount => _notificationCount; 

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // TabController? _tabController;
  // TabController? get tabController => _tabController;

  List _commentLike = [
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {"like": 0, "comment": "Lorem Ipsum is simply dummy text of the printing"},
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
    {
      "like": 0,
      "comment":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.."
    },
  ];
  List get commentLike => _commentLike;

  getNotificationCount() async {
    try {
      var headers = {
        'x-auth-token': accessToken!,
        // 'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjBmYzA1NTZjLWViYTYtNDU1ZS1iZGIyLTc4ZTM3Nzk4YzA1YiIsImlhdCI6MTY5NTMwNzYxMiwiZXhwIjoxNjk1OTEyNDEyfQ._8gDn546-y6L1nOK0143l8UMxlMZkU7Acp3HBeejJ7s',
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getNotification));
      request.body = json.encode({
        "seen": false
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var resp = await response.stream.bytesToString();
        var jsonResp = jsonDecode(resp);
        print(jsonResp["data"]["notification_count"]);
        _notificationCount = jsonResp["data"]["notification_count"];
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

  changeTab(int index) {
    _currentIndex = index;
    update();
  }

  likeMethod(int index, int like) {
    _commentLike[index]["like"] = like == 0 ? 1 : 0;
    update();
  }

  commentMethod(String comment) {
    // print("comment " + comment);
    var data = {"like": 0, "comment": comment};

    _commentLike.insert(0, data);
    print(_commentLike);
    update();
  }
}
