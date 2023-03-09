import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

import 'discovery_recipe.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/back_arrow.svg",
                        height: 18.h,
                        width: 27.h,
                        color: AppColors.greyD3B3F43,
                      ),
                    ),

                    Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontFamily: "StudioProR",
                          fontWeight: FontWeight.bold,
                          fontSize: 22.h,
                          color: Color(0xFF54595F)),
                    ),

                    textgreyD16BoldSP("Save")
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),

                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 150.w,
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
                          child: Image(
                            height: 22.h,
                            width: 22.h,
                            image: AssetImage("assets/Group 57623.png")))
                    ],
                  ),
                ),

                sizedBoxHeight(25.h),
                
                // TextFormField(
                //   maxLength: 100,
                //   maxLines: 5,
                //   decoration: InputDecoration(
                //     hintText: 'Bio',
                //     hintStyle: TextStyle(
                //         color: Color(0xFF707070),
                //         fontSize: 14.h,
                //         fontWeight: FontWeight.w400,
                //         fontFamily: "Roboto"),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(8.r),
                //             topRight: Radius.circular(8.r)),
                //         borderSide: BorderSide(
                //             width: 0.5.w,
                //             color: const Color.fromRGBO(191, 191, 191, 1))),
                //   ),
                // ),

                // SizedBox(
                //   height: 20.h,
                // ),
                textgreyD16MedSP("Username*"),

                sizedBoxHeight(4.h),

                textgreyM14Robo("@Namrata07"),

                sizedBoxHeight(20.h),
                // textgreyM14Robo("@Namrata07"),

                textgreyD16MedSP("First Name*"),

                sizedBoxHeight(4.h),

                textgreyM14Robo("Namrata"),

                sizedBoxHeight(20.h),

                textgreyD16MedSP("Last Name*"),

                sizedBoxHeight(4.h),

                textgreyM14Robo("Burondkar"),

                sizedBoxHeight(15.h),

                textgreyD16MedSP("Bio"),
                
                TextFormField(
                  // maxLength: 100,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Bio',
                    hintStyle: TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 14.sp,
                        // fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            topRight: Radius.circular(8.r)),
                        borderSide: BorderSide(
                            width: 0.5.w,
                            color: AppColors.greyL979797  )
                      ),
                     enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            topRight: Radius.circular(8.r)),
                        borderSide: BorderSide(
                            width: 0.5.w,
                            color: AppColors.greyL979797  )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            topRight: Radius.circular(8.r)),
                        borderSide: BorderSide(
                            width: 0.5.w,
                            color: AppColors.greyL979797  )
                      ),

                  ),
                ),

                sizedBoxHeight(22.h),
                 
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

                sizedBoxHeight(20.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
