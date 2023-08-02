import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowers/myFollowerContent.dart';

class myFollowerCard extends StatefulWidget {
  const myFollowerCard({
    super.key,
  });

  @override
  State<myFollowerCard> createState() => _myFollowerCardState();
}

class _myFollowerCardState extends State<myFollowerCard> {
  int currentIndex = 0;

  // int index = 0;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: followerData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    followerlistCard(
                      followerData[index]["recipeimage"],
                      followerData[index]["title"],
                      followerData[index]["name"],
                      index,
                      followerData[index]["isFollowedByMe"],
                    )
                  ],
                );
              })
        ],
      ),
    );
  }

  Widget followerlistCard(dynamic recipeimage, dynamic title, dynamic name,
      int index, int isFollowedByMe) {
    // bool like = false;

    return Container(
        child: Column(
      children: [
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
                    width: 50.w,
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.grey,
                      child: Image.asset(
                        recipeimage,
                        height: 50.h,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    left: 35.w,
                    child: SvgPicture.asset(
                      "assets/rating-svgrepo-com.svg",
                      height: 22.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    // "Priyanka Joshi",
                    style: TextStyle(
                        fontFamily: "StudioProR",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF54595F)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    name,
                    //    "@priyujoshi",
                    style: TextStyle(
                        fontFamily: "StudioProR",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(59, 63, 67, 0.49)),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    // Get.snackbar(
                    //     snackPosition: SnackPosition.BOTTOM, "", "Removed");
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.grey,
                        content: Center(child: Text('Removed'))));
                  },
                  child:
                      // Container(
                      //     height: 30,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(8),
                      //       border: Border.all(
                      //         color: Color(0xFF3B3F43),
                      //       ),
                      //     ),
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 16.0),
                      //       child: Center(
                      //         child: Text(
                      //           "Remove",
                      //           style: TextStyle(
                      //             fontFamily: "StudioProR",
                      //             fontSize: 14.sp,
                      //             fontWeight: FontWeight.w500,
                      //             color: Color(0xFF3B3F43),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   )
                      Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B3F43),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Center(
                        child: Text(
                          "Remove",
                          style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                width: 16.w,
              )
            ],
          ),
        ),
        Divider(
          endIndent: 20.w,
          indent: 20.w,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    ));
  }
}
