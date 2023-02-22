import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/logo_with_name.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/common%20files/texts.dart';
import 'package:foodspeciality/screens/onboarding/content/onboarding_content.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  // var currentIndex = 0.obs;

  late PageController _controller;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 740.h,
                child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: contents.length,
                    itemBuilder: (_, i) {
                      return Stack(
                        children: [
                          Positioned(
                            top: 40,
                            right: 10,
                            child: Padding(
                              padding: EdgeInsets.only(right: 21.w),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                      onTap: () {
                                        // Get.off(LoginScreen());
                                        Get.toNamed("/login");
                                      },
                                      child: textWhite16RoboBold("Skip"))),
                            ),
                          ),
                          Image.asset(
                            contents[i].image,
                            height: 740.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            children: [
                              sizedBoxHeight(31.h),
                              sizedBoxHeight(65.h),
                              logoWithName(),
                              sizedBoxHeight(420.h),
                              textgrey22BoldRobo(contents[i].title),
                              sizedBoxHeight(7.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 38.w),
                                child: textL_grey14Robo(
                                    contents[currentIndex].discription),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      contents.length, (index) => buildDot(index))),
              sizedBoxHeight(40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: customButton("Continue", onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    // SharedPreferences pref = await SharedPreferences.getInstance();
                    // pref.setBool("onBoarding_done", true);
                    // Get.off(LoginScreen());
                    Get.toNamed("/login");
                    // Get.off
                  }
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 6.w,
      width: currentIndex == index ? 24.w : 6.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.h),
        color: currentIndex == index
            ? AppColors.buttonGrey54595F
            : AppColors.grey707070,
      ),
    );
  }
}
