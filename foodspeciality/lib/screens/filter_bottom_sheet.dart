import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/common_chip.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Future<T?> FilterBottomSheet<T>() {
  return Get.bottomSheet(
      Container(
          // height: double.infinity - 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r))),
          child: Padding(
            padding: EdgeInsets.only(left: 16, top: 35.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13.w, right: 29.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'StudioProB',
                              color: const Color(0xff3B3F43)),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.filter_list_sharp),
                            Text(
                              'Filters',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'StudioProM',
                                  color: const Color(0xff6B6B6B)),
                            )
                          ],
                        ),
                        Text(
                          'Clear All',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'StudioProB',
                              color: const Color(0xff3B3F43)),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxHeight(36.h),
                  Text(
                    'Add Tags',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: 'StudioProM',
                        color: const Color(0xff54595F)),
                  ),
                  Column(
                    children: [
                      sizedBoxHeight(6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              color: AppColors.buttonGrey54595F,
                            ),
                            height: 27.h,
                            width: 70.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                sizedBoxWidth(6.w),
                                SvgPicture.asset(
                                  "assets/svg/add-circle-svgrepo-com.svg",
                                  // height: 15.h,
                                  // width: 15.w,
                                ),
                                Text(
                                  "  Custom",
                                  style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: "Studio Pro",
                                      fontSize: 10.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Select Tags",
                            style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontWeight: FontWeight.w500,
                              fontSize: 18.spMin,
                              color: const Color(0xFF3E3D3D),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight(13.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const CommonChip(text: "Savoury moments"),
                                sizedBoxWidth(11.w),
                                const CommonChip(text: "Quarter to quick"),
                                sizedBoxWidth(11.w),
                                const CommonChip(text: "Juicy Mondays"),
                                sizedBoxWidth(11.w),
                                const CommonChip(text: "The healthy way"),
                                sizedBoxWidth(11.w),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const CommonChip(text: "Fry-day!!"),
                                sizedBoxWidth(11.w),
                                const CommonChip(text: "Simple greens"),
                                sizedBoxWidth(11.w),
                                const CommonChip(text: "Flavour explosions"),
                                sizedBoxWidth(11.w),
                                const CommonChip(text: "The healthy way"),
                                sizedBoxWidth(11.w),
                              ],
                            ),
                          ),
                          sizedBoxHeight(25.h),
                          Text(
                            "South Africa Cuisine",
                            style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontWeight: FontWeight.w500,
                              fontSize: 18.spMin,
                              color: const Color(0xFF3E3D3D),
                            ),
                          ),
                          sizedBoxHeight(12.h),
                          Row(
                            children: [
                              const CommonChip(text: "Limpopo"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Easy"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Food"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Carrot"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Quick"),
                            ],
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Row(
                            children: [
                              const CommonChip(text: "Yoghurt"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Breakfast"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Quick"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Yoghurt"),
                              sizedBoxWidth(11.w),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "International Cuisine",
                            style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontWeight: FontWeight.w500,
                              fontSize: 18.spMin,
                              color: const Color(0xFF3E3D3D),
                            ),
                          ),
                          sizedBoxHeight(12.h),
                          Row(
                            children: [
                              const CommonChip(text: "Limpopo"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Easy"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Food"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Carrot"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Quick"),
                            ],
                          ),
                          SizedBox(
                            height: 13.h,
                          ),
                          Row(
                            children: [
                              const CommonChip(text: "Yoghurt"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Breakfast"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Quick"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Yoghurt"),
                              sizedBoxWidth(11.w),
                            ],
                          ),
                          sizedBoxHeight(20.h),
                          Text(
                            "Select Difficulty",
                            style: TextStyle(
                              fontFamily: "Studio Pro",
                              fontWeight: FontWeight.w500,
                              fontSize: 18.spMin,
                              color: const Color(0xFF3E3D3D),
                            ),
                          ),
                          sizedBoxHeight(12.h),
                          Row(
                            children: [
                              const CommonChip(text: "Easy"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Medium"),
                              sizedBoxWidth(11.w),
                              const CommonChip(text: "Hard"),
                            ],
                          ),
                        ],
                      ),
                      sizedBoxHeight(32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 39.h,
                            width: 113.w,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff54595F),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  side: BorderSide.none,
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  fontFamily: "StudioProR",
                                  fontSize: 16.sp,
                                  color: const Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizedBoxHeight(23.h)
                    ],
                  ),
                ],
              ),
            ),
          )),
      isScrollControlled: true);
}
