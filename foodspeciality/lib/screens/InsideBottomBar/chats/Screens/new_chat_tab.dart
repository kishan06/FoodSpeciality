import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/common%20files/customSearchTextfield.dart';
import 'package:foodspeciality/common%20files/search_noti.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/common%20files/video_player.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatCommunityPage.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatPage.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';


class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final tecComment = TextEditingController();
  int selectedVideoIndex = 0;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // extendBody: true,
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Column(
                children: [
                  CommanTabbar("My Community", "Inspiration"),
                ],
              ),
              Expanded(
                child: Container(
                  color: AppColors.greyLtEBEBEB,
                  // color: Colors.red,

                  child: TabBarView(
                    children: [
                      ChatPage(),
                      ChatCommunityPage(),
                    ]),
                ),
              )
            ],
          )),
    );
  }

}