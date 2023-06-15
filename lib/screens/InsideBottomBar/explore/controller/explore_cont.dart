import 'package:foodspeciality/screens/communityAddparticipants.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  List _likeSave = [
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
  ];
  List get likeSave => _likeSave;

  

  likeMethod(int index, int like) {
    _likeSave[index]["like"] = like == 0 ? 1 : 0;
    update();
  }

  saveMethod(int index, int save) {
    _likeSave[index]["save"] = save == 0 ? 1 : 0;
    update();
  }

  // commentMethod(String comment){
  //   // print("comment " + comment);
  //   var data = {
  //     "like": 0,
  //     "comment": comment
  //   };

  //   _commentLike.insert(0,data);
  //   print(_commentLike);
  //   update();
  // }  
}
