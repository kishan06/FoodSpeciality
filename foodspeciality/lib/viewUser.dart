import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/screens/grivviewuser.dart';
import 'package:get/get.dart';

import 'common files/customtextformfield.dart';

class viewUser extends StatefulWidget {
  const viewUser({super.key});

  @override
  State<viewUser> createState() => _viewUserState();
}

ScrollController? controller;

class _viewUserState extends State<viewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Color(0xFFFFFFFF),
            leading: Icon(
              Icons.arrow_back,
              color: Color(0xFF3B3F43),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(59, 63, 67, 0.49),
                  ),
                  height: 30,
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
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.notifications_none_outlined,
                color: Color(0xFF3B3F43),
              ),
              SizedBox(
                width: 15.w,
              ),
              Icon(
                Icons.more_vert,
                color: Color(0xFF3B3F43),
              ),
              SizedBox(
                width: 13.w,
              ),
            ],
          ),
          Column(children: [
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
                    child: SvgPicture.asset("assets/rating-svgrepo-com.svg")),
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
              child: CustomNextButton(text: "Follow"),
            ),
            SizedBox(
              height: 40.h,
            ),
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                      indicatorColor: Color(0xFF3B3F43),
                      unselectedLabelStyle: TextStyle(color: Color(0xFF6B6B6B)),
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
                  SizedBox(
                    height: 470.h,
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
                          )),
                      following(),
                      followers()
                    ]),
                  )
                ],
              ),
            )
          ])
        ],
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
