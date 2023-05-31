import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SpinTheWheel extends StatefulWidget {
  const SpinTheWheel({super.key});

  @override
  State<SpinTheWheel> createState() => _SpinTheWheelState();
}

class _SpinTheWheelState extends State<SpinTheWheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(color: AppColors.grey54595F
              // .withOpacity(0.84),
              )),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.grey54595F,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Column(
                            children: [
                              sizedBoxHeight(15.h),
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
                            sizedBoxHeight(10.h),
                            Text(
                              "Daily wheel spin",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: "StudioProR",
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white),
                            ),
                            sizedBoxHeight(60.h),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            sizedBoxHeight(50.h),
            SizedBox(
              height: 350.h,
              child: Stack(
                children: [
                  CircularPercentIndicator(
                    backgroundWidth: 32.w,
                    backgroundColor: const Color(0xffBFBAB4),
                    radius: 160.w,
                    center: FortuneWheel(
                      indicators: const [
                        FortuneIndicator(
                            alignment: Alignment.topCenter, child: SizedBox()
                            //  SvgPicture.asset(
                            //   'assets/svg/Vector.svg',
                            // ),
                            )
                      ],
                      items: [
                        FortuneItem(
                            child: textBlack16w400('Try again'),
                            style: FortuneItemStyle(
                                borderWidth: 4.w,
                                borderColor: Colors.white,
                                color: const Color(0xffE3E0DA))),
                        FortuneItem(
                            child: textBlack16w400('10 coins'),
                            style: FortuneItemStyle(
                                borderWidth: 4.w,
                                borderColor: Colors.white,
                                color: const Color(0xffEFEFEF))),
                        FortuneItem(
                            child: textBlack16w400('1 coin'),
                            style: FortuneItemStyle(
                                borderWidth: 4.w,
                                borderColor: Colors.white,
                                color: const Color(0xffE3E4E0))),
                        FortuneItem(
                            child: textBlack16w400('Unlucky'),
                            style: FortuneItemStyle(
                                borderWidth: 4.w,
                                borderColor: Colors.white,
                                color: const Color(0xffE0DAD2))),
                        FortuneItem(
                            child: textBlack16w400('25 coins'),
                            style: FortuneItemStyle(
                                borderWidth: 4.w,
                                borderColor: Colors.white,
                                color: const Color(0xffEEEBE2))),
                        FortuneItem(
                            child: textBlack16w400('25 coins'),
                            style: FortuneItemStyle(
                                borderWidth: 4.w,
                                borderColor: Colors.white,
                                color: const Color(0xffE3E4E0))),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SvgPicture.asset('assets/svg/Vector.svg')),
                ],
              ),
            ),
            sizedBoxHeight(80.h),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => AppColors.grey54595F)),
              onPressed: () {
                Get.back();
                Get.to(() => const SpinTheWheel());
              },
              child: Text(
                'Spin the Wheel',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            sizedBoxHeight(25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.w),
              child: Text(
                'Spin, Win & Collect Coins! Collect Coins With A Single Spin Daily“',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.grey54595F,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
