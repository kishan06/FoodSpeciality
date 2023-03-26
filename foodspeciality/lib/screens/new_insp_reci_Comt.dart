import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class NewInspiRecipeComment extends StatefulWidget {
  const NewInspiRecipeComment({super.key});

  @override
  State<NewInspiRecipeComment> createState() => _NewInspiRecipeCommentState();
}

class _NewInspiRecipeCommentState extends State<NewInspiRecipeComment> {

  int selectedVideoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 258.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Mask Group 14.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizedBoxHeight(26.h),
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child:
                                    SvgPicture.asset('assets/Path 39.svg',
                                      height: 18.h,
                                      width: 27.w,
                                    )),
                          ],
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                                "assets/svg/media-play-circle-svgrepo-com.svg",
                                  height: 63.h,
                                  width: 63.h,
                                ),
                            sizedBoxHeight(30.h),
                            sizedBoxHeight(5.h),
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.9),
                                  blurRadius: 25.0, // soften the shadow
                                  spreadRadius: 20.0, //extend the shadow
                                  offset: const Offset(
                                    5.0, // Move to right 5  horizontally
                                    5.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ]),
                              height: 35.h,
                              width: double.infinity,
                              child: Text(
                                "Chomolia Recipe",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              ),
                            ),

                            SizedBox(
                              height: 27.h,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 5.w);
                                },
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedVideoIndex = index;
                                        // listCardData[index]["selectedVideoInde"] = index;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.h),
                                          color: index == selectedVideoIndex
                                              ? AppColors.white.withOpacity(0.7)
                                              : AppColors.greyD3B3F43
                                                  .withOpacity(0.7)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7.w, vertical: 5.h),
                                        child: selectedVideoIndex == index
                                            ? textgreyD12Robo("Video")
                                            : textWhite12Robo("Video"),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),


                            sizedBoxHeight(8.h),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80.h,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14.sp,
                          color: Colors.white,
                        ),
                        sizedBoxWidth(3.w),
                        Text(
                          "30 Min",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'StudioProM',
                              fontSize: 12.sp,
                              color: const Color(0xffFFFFFF)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            
         
          ],
        )
      ),
    );
  }
}