import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingContent.dart';

class myFollowingCard extends StatefulWidget {
  const myFollowingCard({
    super.key,
  });

  @override
  State<myFollowingCard> createState() => _myFollowingState();
}

class _myFollowingState extends State<myFollowingCard> {
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: followingData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      followinglistCard(
                        followingData[index]["recipeimage"],
                        followingData[index]["title"],
                        followingData[index]["name"],
                        index,
                        followingData[index]["isFollowedByMe"],
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget followinglistCard(dynamic recipeimage, dynamic title, dynamic name,
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
                    width: 50,
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.grey,
                      child: Image.asset(
                        recipeimage,
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
                        color: Color(0xFF54595F)),
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
                        color: Color.fromRGBO(59, 63, 67, 0.49)),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                  onTap: () {
                    setState(() {
                      followingData[index]["isFollowedByMe"] =
                          isFollowedByMe == 0 ? 1 : 0;
                    });
                  },
                  child: isFollowedByMe == 0
                      ? Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFF3B3F43),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Center(
                              child: Text(
                                "Following",
                                style: TextStyle(
                                  fontFamily: "StudioProR",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3B3F43),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
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
                        )),
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
      ],
    ));
  }
}
