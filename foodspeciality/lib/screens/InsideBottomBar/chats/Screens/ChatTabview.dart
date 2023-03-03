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
      // drawer: NavDrawer(),
      // appBar: AppBar(
      //   title: Text(
      //     'Chats',
      //     softWrap: true,
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //         fontFamily: 'Poppins',
      //         fontSize: 19.sm,
      //         fontWeight: FontWeight.w400,
      //         color: Colors.black),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 2,
      //   shadowColor: Colors.black,
      //   automaticallyImplyLeading: false,
      //   titleSpacing: 0,
      //   leading: Row(
      //     children: [
      //       IconButton(
      //         onPressed: () {
      //           _key.currentState!.openDrawer();
      //         },
      //         icon: SvgPicture.asset("assets/images/menu.svg"),
      //         color: Colors.black,
      //         iconSize: 25,
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     Icon(
      //       Icons.more_vert_rounded,
      //       color: Colors.black87,
      //     ),
      //   ],
      // ),
      // bottomNavigationBar:
      //     CreateBottomBar(stateBottomNav, "Bottombarchat", context),
      body: Column(
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
                  child: TabBarView(children: [
                    ChatPage(),
                    ChatCommunityPage(),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
