import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../common files/app_bar.dart';
import '../common files/sized_box.dart';

class JoinChallenge extends StatefulWidget {
  const JoinChallenge({super.key});

  @override
  State<JoinChallenge> createState() => _JoinChallengeState();
}

class _JoinChallengeState extends State<JoinChallenge> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 1,
                                image:
                                    AssetImage('assets/home/food_bowl.png'))),
                        // child: Image.asset(
                        //   "assets/Mask Group 108.png",
                        //   // color: Color.fromARGB(255, 168, 168, 168).withOpacity(0.54),
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                sizedBoxHeight(26.h),
                                SvgPicture.asset('assets/Path 39.svg'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The " Main" Mains Challenge',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Studio Pro",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.sp),
                                ),
                                sizedBoxHeight(10.h),
                                Text(
                                  "Let's bring 'main-course' to the forefront \nthis week",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp),
                                ),
                                sizedBoxHeight(20.h),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  centerTitle: true,
                ),
                expandedHeight: 220,
                backgroundColor: Colors.white,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (context, index) => SingleChildScrollView(
                    // physics: BouncingScrollPhysics(),
                    child: Container(
                      // padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.sp),
                            topRight: Radius.circular(30.sp)),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      // width: 20,
                      // height: 600,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxHeight(10.h),
                            Material(
                              shape: Border.all(color: Colors.transparent),
                              color: Colors.white,
                              elevation: 2,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                height: 86.h,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    sizedBoxWidth(9.w),
                                    CircularPercentIndicator(
                                      radius: 28.r,
                                      percent: 0.72,
                                      startAngle: 320,
                                      progressColor: const Color(0xff3B3F43),
                                      lineWidth: 2,
                                      center: const Icon(
                                        Icons.calendar_today_outlined,
                                        size: 18,
                                      ),
                                    ),
                                    sizedBoxWidth(10.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '2 Days Left',
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontFamily: 'StudioProM',
                                              color: const Color(0xff3B3F43)),
                                        ),
                                        sizedBoxHeight(5.h),
                                        LinearPercentIndicator(
                                          barRadius: Radius.circular(5.r),
                                          padding: const EdgeInsets.all(0),
                                          width: 186.w,
                                          percent: 0.4,
                                          progressColor:
                                              const Color(0xff979797),
                                          backgroundColor:
                                              const Color(0xffF2F2F2),
                                        ),
                                        // sizedBoxHeight(10.h)
                                      ],
                                    ),
                                    sizedBoxWidth(27.w),
                                    Text(
                                      'Submit recipe',
                                      style: TextStyle(
                                        fontFamily: 'StudioProM',
                                        fontSize: 14.sp,
                                        color: const Color(0xff3B3F43),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16.sp,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // const Divider(
                            //     // color: const Color(0xff00000029),
                            //     ),
                            sizedBoxHeight(10.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                "12 Recipes Shared",
                                style: TextStyle(
                                    color: const Color(0xff3B3F43),
                                    fontFamily: "StudioProM",
                                    fontSize: 18.sp),
                              ),
                            ),
                            sizedBoxHeight(10.h),
                            SizedBox(
                              // height: 520.h,
                              child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Card(
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        color: Colors.white,
                                        margin: const EdgeInsets.all(0),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              13.w, 13.h, 0, 16.4),
                                          // decoration: BoxDecoration(
                                          //     border: Border.all(
                                          //         color: const Color(0xff707070),
                                          //         width: 0.2),
                                          //     borderRadius:
                                          //         BorderRadius.circular(10.r)),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 112.h,
                                                width: 133.w,
                                                decoration: BoxDecoration(
                                                    image:
                                                        const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/home/food.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                              ),
                                              sizedBoxWidth(27.w),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Slappappoffer Recipe",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "StudioProM",
                                                        fontSize: 18.sp,
                                                        color: const Color(
                                                            0xFF000000)),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Text(
                                                    "@priyujoshi",
                                                    style: TextStyle(
                                                        fontFamily: "Roboto",
                                                        fontSize: 14.sp,
                                                        color: const Color(
                                                            0xff6B6B6B)),
                                                  ),
                                                  sizedBoxHeight(26.h),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      iconText(
                                                          'assets/like-svgrepo-com.svg',
                                                          '23k'),
                                                      sizedBoxWidth(20.w),
                                                      iconText(
                                                          'assets/comment.svg',
                                                          '230'),
                                                      sizedBoxWidth(20.w),
                                                      iconText(
                                                          'assets/Bookmark.svg',
                                                          '50'),
                                                      sizedBoxWidth(40.w),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/icons/time.svg'),
                                                          sizedBoxWidth(2.w),
                                                          Text(
                                                            '30 Min',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Roboto',
                                                                fontSize:
                                                                    10.sp),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 15.h,
                                    );
                                  },
                                  itemCount: 5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget iconText(String imagePath, String text) {
    return Column(
      children: [
        SvgPicture.asset(
          imagePath,
          width: 18.w,
          height: 16.h,
        ),
        sizedBoxHeight(10.h),
        textForFav(text)
      ],
    );
  }

  Widget textForFav(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 10.sp, fontFamily: "StudioProR"),
    );
  }
}
