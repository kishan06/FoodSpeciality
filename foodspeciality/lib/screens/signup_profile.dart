import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'discovery_recipe.dart';

class SignupProfile extends StatefulWidget {
  SignupProfile({super.key});

  @override
  State<SignupProfile> createState() => _SignupProfileState();
}

class _SignupProfileState extends State<SignupProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Set Up Your Profile",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontWeight: FontWeight.bold,
                      fontSize: 22.h,
                      color: Color(0xFF54595F)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 150,
                      child: CircleAvatar(
                        radius: 51.r,
                        backgroundColor: Colors.grey,
                        child: const Image(
                          image: AssetImage("assets/Mask Group 40.png"),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 10.h,
                        left: 100.w,
                        child: const Image(
                            image: AssetImage("assets/Group 57623.png")))
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Namrata Burondkar",
                  style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ),
                Text(
                  "@Namrata07",
                  style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 16.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  maxLength: 100,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Bio',
                    hintStyle: TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            topRight: Radius.circular(8.r)),
                        borderSide: BorderSide(
                            width: 0.5.w,
                            color: const Color.fromRGBO(191, 191, 191, 1))),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Current Location",
                      style: TextStyle(
                          color: Color(0xFF3B3F43),
                          fontSize: 18.h,
                          fontFamily: "StudioProR",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(image: AssetImage("assets/Page-1.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "South Africa,Western Cape",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(151, 151, 151, 0.48),
                          fontFamily: "Roboto",
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Social/Website Links",
                      style: TextStyle(
                          color: Color(0xFF3B3F43),
                          fontSize: 18.h,
                          fontFamily: "StudioProR",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image: AssetImage(
                                  "assets/website-ui-web-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "https://foodspecialities.com",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(151, 151, 151, 0.48),
                          fontFamily: "Roboto",
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image: AssetImage(
                                  "assets/instagram-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "https://food_specialities.com",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(151, 151, 151, 0.48),
                          fontFamily: "Roboto",
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image:
                                  AssetImage("assets/twitter-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "https://food_specialities/twitter.com",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(151, 151, 151, 0.48),
                          fontFamily: "Roboto",
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image: AssetImage(
                                  "assets/pinterest-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "https://foodspecialities/pinterest.com",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(151, 151, 151, 0.48),
                          fontFamily: "Roboto",
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 17.r,
                          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                        const Positioned.fill(
                          child: Image(
                              image: AssetImage(
                                  "assets/facebook-svgrepo-com.png")),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      "https://foodspeciality/facebook.com",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(151, 151, 151, 0.48),
                          fontFamily: "Roboto",
                          fontSize: 16.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width / 2 - 30.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/discoveryRecipes");
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(
                                color: Color(0xFF54595F), width: 1.w),
                          ),
                          elevation: 0,
                          primary: Color(0xFF54595F),
                          onPrimary: Colors.grey,
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: 18.h,
                              fontFamily: "StudioProR"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width / 2 - 30.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed("/discoveryRecipes");
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(color: Colors.grey, width: 1.w),
                          ),
                          elevation: 0,
                          primary: Colors.transparent,
                          onPrimary: Colors.grey,
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.h,
                              fontFamily: "StudioProR"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
