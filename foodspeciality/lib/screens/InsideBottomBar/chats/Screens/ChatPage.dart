import 'package:flutter/material.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Model/ChatUserModel.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Widgets/ConversationList.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<ChatPrivate> chatPrivate = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // CustomAppBarWithNotification(titleTxt: "Chats"),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color(0xFF707070),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color(0xFF707070),
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: chatPrivate.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ConversationList(
                      name: chatPrivate[index].name,
                      messageText: chatPrivate[index].messageText,
                      imageUrl: chatPrivate[index].imageURL,
                      time: chatPrivate[index].time,
                      isMessageRead: (index == 0 || index == 3 || index == 2)
                          ? true
                          : false,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
