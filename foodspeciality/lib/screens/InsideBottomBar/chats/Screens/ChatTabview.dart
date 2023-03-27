import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/comman_app_bar.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatCommunityPage.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatPage.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

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
      // appBar: CustomAppBar(titleTxt: ""),
      key: _key,
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, top: 10.h),
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            "assets/icons/back_arrow.png",
                            height: 20.h,
                            width: 30.w,
                            color: AppColors.greyD3B3F43,

                            // color: ,
                          ),
                        ),
                      ),
                    ],
                  ),
                  CommanTabbar("Private", "Community"),
                  SizedBox(
                    height: 750.h,
                    child: const TabBarView(
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
