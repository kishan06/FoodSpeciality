import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Model/ChatUserModel.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Widgets/CommunityConversationList.dart';
import 'package:get/get.dart';

class ChatCommunityPage extends StatefulWidget {
  const ChatCommunityPage({Key? key}) : super(key: key);

  @override
  _ChatCommunityPageState createState() => _ChatCommunityPageState();
}

class _ChatCommunityPageState extends State<ChatCommunityPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<ChatCommunity> chatcommunity = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
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
              Container(
                height: 620.h,
                child: ListView.builder(
                  itemCount: chatcommunity.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CommunityConversationList(
                      name: chatcommunity[index].name,
                      member: chatcommunity[index].members,
                      messageText: chatcommunity[index].messageText,
                      imageUrl: chatcommunity[index].imageURL,
                      isMessageRead: (index == 0 || index == 3 || index == 2)
                          ? true
                          : false,
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      // ignore: deprecated_member_use
                      primary: const Color(0xFF3B3F43),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFF707070)),
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Text(
                          "New Community",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sm,
                            fontFamily: 'StudioProR',
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                          title: "",
                          content: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.close),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: Color(0xFF979797)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Color(0xFF979797),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.all(17),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintStyle: TextStyle(
                                          color: Color(0xFF54595F63),
                                          fontSize: 20.sm,
                                          fontFamily: "StudioProR"),
                                      hintText: "Community Name",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    cursorColor: const Color(0xFFFFB600),
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(14),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF979797),
                                            width: 0.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF979797),
                                            width: 0.5),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Color(0xFF979797),
                                            width: 0.5),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 1),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 1),
                                      ),
                                      hintStyle: TextStyle(
                                          fontFamily: "StudioProR",
                                          color: Color(0x80000000),
                                          fontSize: 17.sm),
                                      hintText: "Community Description",
                                    ),
                                    minLines: 5,
                                    maxLines: null,
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    width: 170.w,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        // ignore: deprecated_member_use
                                        primary: const Color(0xFF3B3F43),
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: Color(0xFF707070)),
                                          borderRadius:
                                              BorderRadius.circular(8.h),
                                        ),
                                      ),
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sm,
                                          fontFamily: 'StudioProR',
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.toNamed("communityaddparticipants");
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                left: 90,
                                top: -70,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 60,
                                          color: Colors.grey,
                                          spreadRadius: 0)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    //  foregroundColor: Colors.white,
                                    radius: 44,
                                    child: SvgPicture.asset(
                                        "assets/community.svg"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // title: "Welcome to Flutter Dev'S",
                          // middleText:
                          //     "FlutterDevs is a protruding flutter app development company with "
                          //     "an extensive in-house team of 30+ seasoned professionals who know "
                          //     "exactly what you need to strengthen your business across various dimensions",
                          backgroundColor: Colors.white,
                          titleStyle: TextStyle(fontSize: 0),
                          // middleTextStyle: TextStyle(color: Colors.white),
                          radius: 10);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
