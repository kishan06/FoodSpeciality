import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/logo_with_name.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:foodspeciality/screens/onboarding/onboarding.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 94.h,
            ),
            Image.asset(
              "assets/FS Icon.png",
              height: 216.h,
              width: 216.w,
            ),
            SizedBox(
              height: 40.h,
            ),
            textWhite30BoldRobo("Welcome!"),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                width: 348.w,
                child: textL_grey14Robo(
                    "Let's connect with your community! Share and discover exciting and versatile recipes.")),
            sizedBoxHeight(314.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: customButtonWithBorder("Continue", onPressed: () {
                // print("pressed");
                // Get.to(OnBoarding());
                Get.toNamed("/onboard");
              }),
            )
          ],
        ),
      ),
    );
  }
}
