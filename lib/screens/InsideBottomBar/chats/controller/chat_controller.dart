import 'package:foodspeciality/screens/InsideBottomBar/chats/Model/ChatUserModel.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
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
