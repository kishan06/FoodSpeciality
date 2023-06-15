import 'package:foodspeciality/screens/InsideBottomBar/chats/Model/ChatUserModel.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  List<ChatPrivate> _chatPrivate = [
    ChatPrivate(
      name: "Priyanka Joshi",
      messageText: "Awesome Setup",
      imageURL: "assets/chef.png",
      time: "Now",
    ),
    ChatPrivate(
      name: "Mokshada Kesarkar",
      messageText: "That's Great",
      imageURL: "assets/ladychef.png",
      time: "Yesterday",
    ),
    ChatPrivate(
      name: "Sandeep Kanojia",
      messageText: "Hey where are you?",
      imageURL: "assets/boychef.png",
      time: "31 Mar",
    ),
    ChatPrivate(
      name: "Priyanka Joshi",
      messageText: "Busy! Call me in 20 mins",
      imageURL: "assets/chef.png",
      time: "28 Mar",
    ),
    ChatPrivate(
      name: "Mokshada Kesarkar",
      messageText: "Thankyou, It's awesome",
      imageURL: "assets/ladychef.png",
      time: "23 Mar",
    ),
    ChatPrivate(
      name: "Sandeep Kanojia",
      messageText: "will update you in evening",
      imageURL: "assets/boychef.png",
      time: "17 Mar",
    ),
    ChatPrivate(
      name: "Priyanka Joshi",
      messageText: "Can you please share the file?",
      imageURL: "assets/chef.png",
      time: "24 Feb",
    ),
    ChatPrivate(
      name: "Mokshada Kesarkar",
      messageText: "How are you?",
      imageURL: "assets/ladychef.png",
      time: "18 Feb",
    ),
    ChatPrivate(
      name: "Sandeep Kanojia",
      messageText: "Where are you?",
      imageURL: "assets/boychef.png",
      time: "20 Feb",
    ),
  ];
  List<ChatPrivate> get chatPrivate => _chatPrivate;

  final List<ChatPrivate> _chatPrivateBackup = [
    ChatPrivate(
      name: "Priyanka Joshi",
      messageText: "Awesome Setup",
      imageURL: "assets/chef.png",
      time: "Now",
    ),
    ChatPrivate(
      name: "Mokshada Kesarkar",
      messageText: "That's Great",
      imageURL: "assets/ladychef.png",
      time: "Yesterday",
    ),
    ChatPrivate(
      name: "Sandeep Kanojia",
      messageText: "Hey where are you?",
      imageURL: "assets/boychef.png",
      time: "31 Mar",
    ),
    ChatPrivate(
      name: "Priyanka Joshi",
      messageText: "Busy! Call me in 20 mins",
      imageURL: "assets/chef.png",
      time: "28 Mar",
    ),
    ChatPrivate(
      name: "Mokshada Kesarkar",
      messageText: "Thankyou, It's awesome",
      imageURL: "assets/ladychef.png",
      time: "23 Mar",
    ),
    ChatPrivate(
      name: "Sandeep Kanojia",
      messageText: "will update you in evening",
      imageURL: "assets/boychef.png",
      time: "17 Mar",
    ),
    ChatPrivate(
      name: "Priyanka Joshi",
      messageText: "Can you please share the file?",
      imageURL: "assets/chef.png",
      time: "24 Feb",
    ),
    ChatPrivate(
      name: "Mokshada Kesarkar",
      messageText: "How are you?",
      imageURL: "assets/ladychef.png",
      time: "18 Feb",
    ),
    ChatPrivate(
      name: "Sandeep Kanojia",
      messageText: "Where are you?",
      imageURL: "assets/boychef.png",
      time: "20 Feb",
    ),
  ];
  List<ChatPrivate> get chatPrivateBackup => _chatPrivateBackup;

  List<ChatCommunity> _chatcommunity = [
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "Food Specialities",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "Food Specialities",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "Food Specialities",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
  ];
  List<ChatCommunity> get chatcommunity => _chatcommunity;

  final List<ChatCommunity> _chatcommunityBackUp = [
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "Food Specialities",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "Food Specialities",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "Food Specialities",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
    ChatCommunity(
      name: "WDIPL",
      messageText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's",
      imageURL: "assets/community.png",
      members: '4 Members',
    ),
  ];
  List<ChatCommunity> get chatcommunityBackUp => _chatcommunityBackUp;

  searchFunction(String text) {
    _chatPrivate = _chatPrivateBackup
        .where((tName) {
          var tNameTitle = tName.name.toLowerCase();
          // var tNameTitle = _chatPrivate.

          return tNameTitle.contains(text);
        })
        .toSet()
        .toList();
    update();
  }

  searchFunctionCom(String text) {
    _chatcommunity = chatcommunityBackUp
        .where((tName) {
          var tNameTitle = tName.name.toLowerCase();
          // var tNameTitle = _chatPrivate.

          return tNameTitle.contains(text);
        })
        .toSet()
        .toList();
    update();
  }
}
