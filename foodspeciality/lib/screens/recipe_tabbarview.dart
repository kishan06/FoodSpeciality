import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';

import 'common_chip.dart';

class RecipeTabbarView extends StatefulWidget {
  const RecipeTabbarView({super.key});

  @override
  State<RecipeTabbarView> createState() => _RecipeTabbarViewState();
}

class _RecipeTabbarViewState extends State<RecipeTabbarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizedBoxHeight(22.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Upload A New Recipe",
                    style: TextStyle(
                        fontFamily: "Studio Pro",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(84, 89, 95, 1)),
                  ),
                ],
              ),
              sizedBoxHeight(20.h),
              SizedBox(
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    // ignore: deprecated_member_use
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/svg/add-media-svgrepo-com.svg"),
                      SizedBox(
                        width: 7.42.w,
                      ),
                      Text(
                        "Upload Video",
                        style: TextStyle(
                          fontFamily: "Studio Pro",
                          fontWeight: FontWeight.w500,
                          fontSize: 18.spMin,
                          color: const Color(0xFF3E3D3D),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              sizedBoxHeight(20.h),
              Container(
                  // color: const Color(0xFF3B3F43),
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(242, 242, 242, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      side: BorderSide(
                          color: const Color(0xFF979797), width: 1.w),
                    ),
                  ),
                  height: 200.h,
                  width: double.infinity,
                  child: Column(
                    children: [
                      sizedBoxHeight(30.h),
                      SvgPicture.asset(
                        "assets/svg/upload-filled-svgrepo-com.svg",
                        height: 47.h,
                      ),
                      sizedBoxHeight(11.h),
                      Text(
                        "Add Cover Image",
                        style: TextStyle(
                          fontFamily: "Studio Pro",
                          fontWeight: FontWeight.w500,
                          fontSize: 18.spMin,
                          color: const Color(0xFF3E3D3D),
                        ),
                      ),
                      sizedBoxHeight(7.h),
                      Text(
                        "Add a high quality and perfect image of \nyour food to inspire others.",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12.spMin,
                            color: const Color(0xFF979797)),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
              sizedBoxHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Name Your Recipe",
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
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff70707054)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF70707054)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    hintText: "Recipe's name",
                    hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        color: const Color(0xff54595f63),
                        fontSize: 17.h),
                  ),
                ),
              ),
              sizedBoxHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Description",
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
              SizedBox(
                height: 112.h,
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff70707054)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF70707054)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    hintText: "Describe your recipe!",
                    hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        color: const Color(0xff54595f63),
                        fontSize: 17.h),
                  ),
                ),
              ),
              sizedBoxHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Add Tags",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.spMin,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Add tags to make your post easy to find!",
                    style: TextStyle(fontFamily: "Roboto", fontSize: 14.sp),
                  ),
                ],
              ),
              sizedBoxHeight(18.h),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.spMin,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(10)
            ],
          ),
        ),
      ),
    );
  }
}
