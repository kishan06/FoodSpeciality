import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

var totalCoins = 2000.obs;

class Challenges extends StatefulWidget {
  final int? challengeTabIndex;
  const Challenges({super.key, this.challengeTabIndex});

  @override
  State<Challenges> createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  // init
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.challengeTabIndex ?? 0,
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.h),
          child: Column(
            children: [
              Container(
                color: AppColors.grey54595F,
                // .withOpacity(0.84),
                child: Column(
                  children: [
                    sizedBoxHeight(40.w),
                    Container(
                      color: AppColors.grey54595F,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Column(
                                    children: [
                                      sizedBoxHeight(20.h),
                                      Image.asset(
                                        "assets/icons/back_arrow.png",
                                        height: 15.h,
                                        width: 30.w,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                sizedBoxWidth(10.w),
                                Column(
                                  children: [
                                    sizedBoxHeight(20.h),
                                    Text(
                                      "Challenges",
                                      softWrap: true,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: "StudioProR",
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                sizedBoxHeight(5.h),
                                Text(
                                  "Total Rewards Earned",
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white),
                                ),
                                sizedBoxHeight(9.h),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(20.w, 7.h, 20.w, 0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/svg/Coin.png'),
                                      Column(
                                        children: [
                                          Obx(
                                            () => Text(
                                              totalCoins.string,
                                              style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          sizedBoxHeight(5.h)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                sizedBoxHeight(25.h)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxHeight(30.w),
              ButtonsTabBar(
                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                radius: 32,
                backgroundColor: const Color(0xffD9D9D9),
                unselectedBorderColor: const Color(0xffD9D9D9),
                borderWidth: 1,
                borderColor: Colors.white,
                unselectedBackgroundColor: Colors.white,
                unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: AppColors.grey54595F),
                labelStyle: TextStyle(
                  color: AppColors.grey54595F,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
                tabs: const [
                  Tab(text: 'Ongoing'),
                  Tab(
                    text: "Available",
                  ),
                  Tab(
                    text: "Completed",
                  ),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            firstTab(),
            secondTab(),
            thirdTab(),
          ],
        ),
      ),
    );
  }

  Widget firstTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          sizedBoxHeight(15.h),
          challengeContainer(
              'Upload your profile picture', 'profileCircle', 5, 'Start'),
          sizedBoxHeight(25.h),
          challengeContainer('''Upload a recipe (Max 10 recipes a day)''',
              'UploadRecipe', 20, 'Start'),
        ],
      ),
    );
  }

  Widget secondTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          sizedBoxHeight(15.h),
          challengeContainer('Add bio', 'AddBio', 5, 'Get'),
          sizedBoxHeight(25.h),
          challengeContainer(
              'Connect your social accounts', 'ConnectAccount', 5, 'Get'),
          sizedBoxHeight(25.h),
          challengeContainer('''Upload a recipe (Max 10 recipes a day)''',
              'UploadRecipe', 20, 'Get'),
          sizedBoxHeight(25.h),
          challengeContainer(
              'Create a community', 'CreateCommunityChallenges', 5, 'Get'),
          sizedBoxHeight(25.h),
          challengeContainer(
              'Prompt Friends to download app', 'PromptApp', 15, 'Get'),
          sizedBoxHeight(25.h),
        ],
      ),
    );
  }

  Widget thirdTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          sizedBoxHeight(15.h),
          completeContainer('Upload your profile picture', 'profileCircle'),
          sizedBoxHeight(25.h),
        ],
      ),
    );
  }

  Widget challengeContainer(
      String txt, String svg, int coins, String buttonTxt) {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      width: double.infinity,
      // height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 65.w,
                child: SvgPicture.asset(
                  'assets/svg/$svg.svg',
                  fit: BoxFit.contain,
                ),
              ),
              sizedBoxWidth(10.w),
              SizedBox(
                width: 220.w,
                child: Text(
                  txt,
                  style: TextStyle(
                      color: AppColors.grey54595F,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                ),
              ),
            ],
          ),
          sizedBoxWidth(15.w),
          InkWell(
            onTap: () {
              Get.back();
              Get.to(() => const Challenges(
                    challengeTabIndex: 2,
                  ));
              totalCoins += 10;
              showDialog(
                  context: context, builder: (context) => const PPopup());
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/svg/Coin.png',
                      height: 25.h,
                    ),
                    Column(
                      children: [
                        Text(
                          '+$coins',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
                        ),
                        sizedBoxHeight(5.h)
                      ],
                    ),
                    sizedBoxWidth(5.h)
                  ],
                ),
                sizedBoxHeight(8.h),
                Container(
                  width: 60.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  decoration: BoxDecoration(
                      color: const Color(0xff707070),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      buttonTxt,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget completeContainer(String txt, String svg) {
    return Container(
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
      width: double.infinity,
      // height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 65.w,
                child: SvgPicture.asset(
                  'assets/svg/$svg.svg',
                  fit: BoxFit.contain,
                ),
              ),
              sizedBoxWidth(10.w),
              SizedBox(
                width: 220.w,
                child: Text(
                  txt,
                  style: TextStyle(
                      color: AppColors.grey54595F,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                ),
              ),
            ],
          ),
          sizedBoxWidth(20.w),
          SvgPicture.asset('assets/svg/completed.svg'),
        ],
      ),
    );
  }
}

class PPopup extends StatefulWidget {
  const PPopup({super.key});

  @override
  State<PPopup> createState() => _PPopupState();
}

class _PPopupState extends State<PPopup> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(20.h),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              sizedBoxHeight(50.h),
              Text(
                "You Won\n10 Coins !",
                style: TextStyle(
                    color: const Color(0xffFFBD00),
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500),
              ),
              sizedBoxHeight(10.h),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffFFA725)),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  width: 120.w,
                  height: 40,
                  child: Center(
                    child: Text(
                      "ok",
                      style: TextStyle(
                          color: const Color(0xffFFBD00), fontSize: 14.sp),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0.h,
          bottom: 380,
          child: Center(
            child: SvgPicture.asset(
              'assets/svg/CoinsRecieved.svg',
            ),
          ),
        ),
      ],
    );
  }
}
