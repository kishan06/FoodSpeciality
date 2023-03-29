import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:get/get.dart';

class BlockListFull extends StatefulWidget {
  const BlockListFull({super.key});

  @override
  State<BlockListFull> createState() => _BlockListFullState();
}

class _BlockListFullState extends State<BlockListFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(titleTxt: "Blocked List"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight(20.h),
            Row(
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
                          "assets/Mask Group 86.png",
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
                        )),
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Priyanka Joshi",
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
                      "@priyujoshi",
                      style: TextStyle(
                          fontFamily: "StudioProR",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(59, 63, 67, 0.49)),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 31.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(
                            width: 1.sp, color: const Color(0xff3B3F43)),
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.sp))),
                    onPressed: () {
                      Get.snackbar(
                          "Successful", "Unblocked @priyujoshi successfully");
                    },
                    child: Text(
                      "Unblock",
                      style: TextStyle(
                          fontFamily: 'Studio Pro',
                          fontSize: 14.sp,
                          color: const Color(0xff3B3F43)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                )
              ],
            ),
            const Divider(
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(
              height: 15,
            ),
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
                            "assets/Mask Group 86.png",
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
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sandeep Kanojia",
                        style: TextStyle(
                          fontFamily: "StudioProR",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF54595F),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "@sandy0001",
                        style: TextStyle(
                          fontFamily: "StudioProR",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(59, 63, 67, 0.49),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 31.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(
                              width: 1.sp, color: const Color(0xff3B3F43)),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.sp))),
                      onPressed: () {
                        Get.snackbar(
                            "Successful", "Unblocked @sandy0001 successfully");
                      },
                      child: Text(
                        "Unblock",
                        style: TextStyle(
                          fontFamily: 'Studio Pro',
                          fontSize: 14.sp,
                          color: const Color(0xff3B3F43),
                        ),
                      ),
                    ),
                  ),
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
                            "assets/Mask Group 86.png",
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
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
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
                        "@sandy0001",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 31.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                                width: 1.sp, color: const Color(0xff3B3F43)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.sp))),
                        onPressed: () {
                          Get.snackbar("Successful",
                              "Unblocked @sandy0001 successfully");
                        },
                        child: Text(
                          "Unblock",
                          style: TextStyle(
                              fontFamily: 'Studio Pro',
                              fontSize: 14.sp,
                              color: const Color(0xff3B3F43)),
                        )),
                  ),
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
                            "assets/Mask Group 86.png",
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
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sandeep Kanojia",
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
                        "@sandy0001",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 31.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                                width: 1.sp, color: const Color(0xff3B3F43)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.sp))),
                        onPressed: () {
                          Get.snackbar("Successful",
                              "Unblocked @sandy0001 successfully");
                        },
                        child: Text(
                          "Unblock",
                          style: TextStyle(
                              fontFamily: 'Studio Pro',
                              fontSize: 14.sp,
                              color: const Color(0xff3B3F43)),
                        )),
                  ),
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
                            "assets/Mask Group 86.png",
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
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Priyanka Joshi",
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
                        "@priyujoshi",
                        style: TextStyle(
                            fontFamily: "StudioProR",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(59, 63, 67, 0.49)),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 31.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                                width: 1.sp, color: const Color(0xff3B3F43)),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.sp))),
                        onPressed: () {
                          Get.snackbar("Successful",
                              "Unblocked @priyujoshi successfully");
                        },
                        child: Text(
                          "Unblock",
                          style: TextStyle(
                              fontFamily: 'Studio Pro',
                              fontSize: 14.sp,
                              color: const Color(0xff3B3F43)),
                        )),
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
