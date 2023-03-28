import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowers/myFollowerCard.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingCard.dart';
import 'package:foodspeciality/screens/grivviewuser.dart';
import 'package:foodspeciality/screens/report.dart';
import 'package:get/get.dart';

class viewUser extends StatefulWidget {
  const viewUser({super.key});

  @override
  State<viewUser> createState() => _viewUserState();
}

ScrollController? controller;

class _viewUserState extends State<viewUser> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            AppBar(
              backgroundColor: Color(0xFFFFFFFF),
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFF3B3F43),
                ),
              ),
              actions: [
                PopupMenuButton(
                  offset: const Offset(0, 50),
                  color: const Color(0xFFFFFFFF),
                  tooltip: '',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(59, 63, 67, 0.49),
                      ),
                      // height: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                            child: Text(
                          "Links",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 14.sm,
                          ),
                        )),
                      ),
                    ),
                  ),
                  onSelected: (value) {
                    if (value == '/logout') {
                    } else if (value == "/myProfile") {
                      Get.toNamed('/myprofile');
                    }
                  },
                  itemBuilder: (BuildContext bc) {
                    return [
                      PopupMenuItem(
                        value: '',
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/website-ui-web-svgrepo-com.svg",
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Website",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: '',
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/instagram-svgrepo-com.svg",
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Instagram",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: '',
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/twitter-svgrepo-com.svg",
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Twitter",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: '',
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/pinterest-svgrepo-com.svg",
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Pintrest",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: '',
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/facebook-svgrepo-com.svg",
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ];
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.snackbar(
                      "Notifications",
                      "Notification turned on",
                    );
                  },
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Color(0xFF3B3F43),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                PopupMenuButton(
                  offset: const Offset(0, 50),
                  color: const Color(0xFFFFFFFF),
                  tooltip: '',
                  child: Icon(
                    Icons.more_vert,
                    color: Color(0xFF3B3F43),
                  ),
                  onSelected: (value) {
                    if (value == '/Report') {
                    } else if (value == "/Report") {
                      Get.toNamed('/Report');
                    }
                  },
                  itemBuilder: (BuildContext bc) {
                    return [
                      PopupMenuItem(
                        value: '',
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/share-svgrepo-com.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          // Get.to(() => Report());
                          Get.toNamed("/Report");
                        },
                        value: '/Report',
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/question-circle-svgrepo-com.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Report",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Roboto",
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: '',
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/block-svgrepo-com.svg",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Block",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                ),
                SizedBox(
                  width: 13.w,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 150,
                      child: CircleAvatar(
                        radius: 51.r,
                        backgroundColor: Colors.grey,
                        child: const Image(
                          image: AssetImage("assets/Mask Group 86.png"),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0.h,
                        left: 100.w,
                        child:
                            SvgPicture.asset("assets/rating-svgrepo-com.svg")),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Priyanka Joshi",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF54595F)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "@priyujoshi",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(59, 63, 67, 0.49)),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "I love Cooking. Here to learn and share!",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF54595F),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 103.0),
                  child: CustomNextButton(
                      text: "Follow",
                      ontap: () {
                        Get.toNamed("/followuser");
                      }),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Column(
                  children: [
                    TabBar(
                        indicatorColor: Color(0xFF3B3F43),
                        unselectedLabelStyle:
                            TextStyle(color: Color(0xFF6B6B6B)),
                        tabs: [
                          Tab(
                            child: Column(
                              children: [
                                Text(
                                  '169',
                                  style: TextStyle(
                                      fontFamily: "StudioProR",
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff000000),
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  'Recipes',
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff54595F),
                                      fontSize: 16.sm),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            child: Column(
                              children: [
                                Text(
                                  '4.1k',
                                  style: TextStyle(
                                      fontFamily: "StudioProR",
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff000000),
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff54595F),
                                      fontSize: 16.sm),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            child: Column(
                              children: [
                                Text(
                                  '8.6k',
                                  style: TextStyle(
                                      fontFamily: "StudioProR",
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff000000),
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff54595F),
                                      fontSize: 16.sm),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    // SizedBox(
                    //   height: 480,
                    //   child: TabBarView(
                    //children: [
                    //     SingleChildScrollView(
                    //       controller: controller,
                    //       child: Column(
                    //         children: [
                    //           Gridview(),
                    //           SizedBox(
                    //             height: 20,
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     const myFollowingCard(),
                    //     const myFollowingCard(),
                    //   ]),
                    // ),
                  ],
                )
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      Gridview(),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                const myFollowingCard(),
                const myFollowingCard(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class followers extends StatelessWidget {
  const followers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3F43),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 30,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFF3B3F43),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 16.0),
                  //       child: Center(
                  //         child: Text(
                  //           "Follow",
                  //           style: TextStyle(
                  //             fontFamily: "StudioProR",
                  //             fontSize: 14.sp,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color(0xFFFFFFFF),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  // SizedBox(
                  //   height: 30,
                  //   child: OutlinedButton(
                  //       style: ButtonStyle(
                  //         shape: MaterialStateProperty.all(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             side: BorderSide(
                  //               width: 3,
                  //               color: Color(0xFF3B3F43),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       onPressed: () {},
                  //       child: Text(
                  //         "Following",
                  //         style: TextStyle(
                  //             fontFamily: "StudioProR",
                  //             fontSize: 14.sp,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color(0xFF3B3F43)),
                  //       )),
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3F43),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  // SizedBox(
                  //   height: 30,
                  //   child: OutlinedButton(
                  //       style: ButtonStyle(
                  //         shape: MaterialStateProperty.all(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             side: BorderSide(
                  //               width: 3,
                  //               color: Color(0xFF3B3F43),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       onPressed: () {},
                  //       child: Text(
                  //         "Following",
                  //         style: TextStyle(
                  //             fontFamily: "StudioProR",
                  //             fontSize: 14.sp,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color(0xFF3B3F43)),
                  //       )),
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3F43),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  // SizedBox(
                  //   height: 30,
                  //   child: OutlinedButton(
                  //       style: ButtonStyle(
                  //         shape: MaterialStateProperty.all(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             side: BorderSide(
                  //               width: 3,
                  //               color: Color(0xFF3B3F43),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       onPressed: () {},
                  //       child: Text(
                  //         "Following",
                  //         style: TextStyle(
                  //             fontFamily: "StudioProR",
                  //             fontSize: 14.sp,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color(0xFF3B3F43)),
                  //       )),
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3F43),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  // SizedBox(
                  //   height: 30,
                  //   child: OutlinedButton(
                  //       style: ButtonStyle(
                  //         shape: MaterialStateProperty.all(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             side: BorderSide(
                  //               width: 3,
                  //               color: Color(0xFF3B3F43),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       onPressed: () {},
                  //       child: Text(
                  //         "Following",
                  //         style: TextStyle(
                  //             fontFamily: "StudioProR",
                  //             fontSize: 14.sp,
                  //             fontWeight: FontWeight.w500,
                  //             color: Color(0xFF3B3F43)),
                  //       )),
                  // ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFF3B3F43),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class following extends StatelessWidget {
  const following({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 30,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF3B3F43),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Following",
                          style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3B3F43)),
                        )),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                          fontFamily: "StudioProR",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(59, 63, 67, 0.49),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 30,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF3B3F43),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Following",
                          style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3B3F43)),
                        )),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 30,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF3B3F43),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Following",
                          style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3B3F43)),
                        )),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 30,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF3B3F43),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Following",
                          style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3B3F43)),
                        )),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 25.r,
                          backgroundColor: Colors.grey,
                          child: Image.asset(
                            "assets/Mask Group 86.png",
                            height: 50,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0.h,
                          left: 35.w,
                          child: SvgPicture.asset(
                            "assets/rating-svgrepo-com.svg",
                            height: 22,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF54595F)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 30,
                    child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                width: 3,
                                color: Color(0xFF3B3F43),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Following",
                          style: TextStyle(
                              fontFamily: "StudioProR",
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3B3F43)),
                        )),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
            Divider(
              endIndent: 20,
              indent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
