import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';

import 'global.dart';

Widget OtherRecipeCard({
    required String coverImage, 
    required String recipeName,
    required String userName,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160.h,
          // width: 115.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(ApiUrls.base + coverImage)
                  // AssetImage('assets/Chocolate 2.png')
                  ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(9.r),
                  topRight: Radius.circular(9.r))),
        ),
        Material(
          borderRadius: BorderRadius.circular(9.sp),
          elevation: 1.2,
          child: Container(
            // Rp@123@2023
            // height: 49.h,
            // width: 115.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(9.r),
                    bottomRight: Radius.circular(9.r))),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxHeight(3.5.h),
                    Padding(
                      padding: EdgeInsets.only(left: 7.4.w),
                      child: Text(
                        // 'Slappappoffer Recipe',
                        recipeName,
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 15.sp),
                      ),
                      // sizedBoxWidth(16.w),
                      // Image.asset(
                      //   'assets/icons/save.png',
                      //   height: 9.h,
                      //   width: 6.8.w,

                      // ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.4.w),
                      child: Text(
                        // '@Priyujoshi',
                        "@$userName",
                        style: TextStyle(
                            color: const Color(0xff6B6B6B),
                            fontSize: 12.sp,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                    sizedBoxHeight(5.h),
                    // sizedBoxHeight(3.5.h),

                    // sizedBoxHeight(5.h)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
