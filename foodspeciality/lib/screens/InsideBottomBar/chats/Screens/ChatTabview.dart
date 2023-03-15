import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatCommunityPage.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatPage.dart';

class ChattabView extends StatefulWidget {
  const ChattabView({Key? key}) : super(key: key);

  @override
  _ChattabViewState createState() => _ChattabViewState();
}

ScrollController? chatcontroller;

class _ChattabViewState extends State<ChattabView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CommanTabbar("Private", "Community"),
                  SizedBox(
                    height: 750.h,
                    child: TabBarView(
                      children: [
                        ChatPage(),
                        ChatCommunityPage(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
