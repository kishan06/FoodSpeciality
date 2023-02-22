import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/logo_with_name.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/common%20files/texts.dart';
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
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              "assets/splash_screen_bg.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
              // color: AppColors,
            ),
            // color: Colors.black.withOpacity(0.5),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textWhite24BoldRobo("Welcome!"),

                logoWithName(),
                
                SizedBox(
                  width: 348.w,
                  child: textWhite14Robo("Let's connect with your community! Share and discover exciting and versatile recipes.")
                ),

                sizedBoxHeight(151.h),
                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: customButtonWithBorder("Let's Get Started",
                      onPressed: () {
                    // print("pressed");
                    // Get.to(OnBoarding());
                    Get.toNamed("/onboard");
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
