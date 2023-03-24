import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/home.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowers/myFollowerCard.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingCard.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingContent.dart';
import 'package:foodspeciality/screens/edit_profile.dart';
import 'package:foodspeciality/screens/grivviewuser.dart';
import 'package:foodspeciality/screens/onboarding/content/onboarding_content.dart';
import 'package:foodspeciality/screens/setting/setting/setting.dart';
import 'package:foodspeciality/screens/viewUser.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({super.key});

  @override
  State<NewProfile> createState() => _NewProfileState();
}

ScrollController? controller;

class _NewProfileState extends State<NewProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Color(0xFFFFFFFF),
              centerTitle: true,
              title: Text(
                "Complete Your Profile",
                style: TextStyle(
                    fontFamily: "StudioProR",
                    fontSize: 16.spMin,
                    color: Colors.black),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    // Get.to(EditProfile());
                    // Get.toNamed("/EditProfile");
                    Get.to(EditProfile(),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.downToUp);
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
                sizedBoxWidth(20),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed("/setting");
                    Get.to(Setting(),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.downToUp);
                  },
                  child: Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                  ),
                ),
                sizedBoxWidth(18)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CircularPercentIndicator(
                startAngle: 110,
                radius: 55.0,
                lineWidth: 7.0,
                animation: true,
                percent: 0.70,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.black,
                backgroundColor: Colors.grey,
                center: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 40.0,
                  backgroundImage: AssetImage(
                    'assets/profile.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Namrata Burondkar",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF54595F)),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "@Namrata07",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(59, 63, 67, 0.49)),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 108.h,
                  width: 183.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.29),
                        blurRadius: 3.0, // soften the shadow
                        spreadRadius: 0.2, //extend the shadow
                        offset: Offset(
                          3.0, // Move to right 5  horizontally
                          3.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset("assets/bookmark (2).svg"),
                      Text("Level : Silver")
                    ],
                  ),
                ),
                Container(
                  height: 108.h,
                  width: 183.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.29),
                        blurRadius: 3.0, // soften the shadow
                        spreadRadius: 0.2, //extend the shadow
                        offset: Offset(
                          3.0, // Move to right 5  horizontally
                          3.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset("assets/coin.svg"),
                      Text("Total Coins : 500")
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            TabBar(
                indicatorColor: Color(0xFF3B3F43),
                unselectedLabelStyle: TextStyle(color: Color(0xFF6B6B6B)),
                tabs: [
                  Tab(
                    child: Column(
                      children: [
                        Text(
                          '1',
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
                          '0',
                          style: TextStyle(
                              fontFamily: "StudioProR",
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000),
                              fontSize: 20.sp),
                        ),
                        Text(
                          'Saved',
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
                          '5',
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
                          '6',
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
                    )),
                mySaved(),
                myFollowingCard(),
                myFollowerCard()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class myfollowers extends StatelessWidget {
  const myfollowers({
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
                            "Remove",
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
                            "Remove",
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
                            "Remove",
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
                            "Remove",
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

// Widget myFollowinglist() {
//   return SingleChildScrollView(
//     child: Column(
//       children: [
//         ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: listCardData.length,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 // followingListCard(
//                 //     followingData[index]["like"],
//                 //     followingData[index]["save"],
//                 //     index,
//                 //     followingData[index]["isFollowedByMe"]),
//                 sizedBoxHeight(13.h)
//               ],
//             );
//           },
//         ),
//       ],
//     ),
//   );
// }

class mySaved extends StatelessWidget {
  const mySaved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10.h,
          color: AppColors.white,
        ),
        Expanded(
          child: Stack(
            children: [
              Image.asset(
                "assets/mySavedEmpty1.png",
                width: double.infinity,
                //  fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // sizedBoxHeight(500.h),
                  Text(
                    "Let's Explore Recipes",
                    style: TextStyle(
                        fontFamily: "StudioProR",
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),

                  sizedBoxHeight(7.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 38.w),
                    child: textL_grey14Robo(
                        "Connect with your friends, family, chefs and other aspiring cooks."),
                  ),

                  sizedBoxHeight(50.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22.w),
                    child: customButtonWithBorder("Explore Recipes",
                        onPressed: () {}),
                  ),

                  sizedBoxHeight(50.h),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
