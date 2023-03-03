import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';

class IngredientsTabbatview extends StatefulWidget {
  const IngredientsTabbatview({super.key});

  @override
  State<IngredientsTabbatview> createState() => _IngredientsTabbatviewState();
}

class _IngredientsTabbatviewState extends State<IngredientsTabbatview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizedBoxHeight(22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recipe Details",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.spMin,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(15.h),
              Container(
                height: 101.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sizedBoxWidth(14.w),
                    SvgPicture.asset("assets/svg/Group 58248.svg"),
                    sizedBoxWidth(15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cooking Time",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "How long does it take \nto make this recipe?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Color(0xff979797),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    sizedBoxWidth(55.w),
                    Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xff707070)),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        height: 45.h,
                        width: 116.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "00 : 00",
                              style:
                                  TextStyle(fontFamily: "Roboto", fontSize: 20),
                            ),
                            const Text(
                              " Min",
                              style:
                                  TextStyle(fontFamily: "Roboto", fontSize: 15),
                            ),
                            sizedBoxWidth(1),
                          ],
                        )),
                  ],
                ),
              ),
              sizedBoxHeight(15.h),
              Container(
                height: 101.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sizedBoxWidth(14.w),
                    SvgPicture.asset("assets/svg/Group 58247.svg"),
                    sizedBoxWidth(15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Servings",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "How many people does \nthis recipe serve?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color(0xff979797),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    sizedBoxWidth(45.w),
                    Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xff707070)),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        height: 45.h,
                        width: 116.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              " 0 Serving",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: "Roboto"),
                            ),
                            sizedBoxWidth(1),
                          ],
                        )),
                  ],
                ),
              ),
              sizedBoxHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recipe Details",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.spMin,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(15.h),
              Row(
                children: [
                  SizedBox(
                    height: 45.h,
                    width: 155.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff70707054)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF70707054)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        hintText: "Ex. Salt",
                        hintStyle: TextStyle(
                            fontFamily: "Roboto",
                            color: const Color(0xff54595f63),
                            fontSize: 17.h),
                      ),
                    ),
                  ),
                  sizedBoxWidth(33.w),
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Color(0xffE1E1E1),
                    child: const Text(
                      "-",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  sizedBoxWidth(10.w),
                  SizedBox(
                    height: 45.h,
                    width: 124.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff70707054)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF70707054)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        hintText: "Ex. 1 TBS",
                        hintStyle: TextStyle(
                            fontFamily: "Roboto",
                            color: const Color(0xff54595f63),
                            fontSize: 17.h),
                      ),
                    ),
                  ),
                  sizedBoxWidth(10.w),
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: const Color(0xffE1E1E1),
                    child: const Text(
                      "+",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
              sizedBoxHeight(13.h),
              Row(
                children: [
                  SizedBox(
                    height: 45.h,
                    width: 155.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff70707054)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF70707054)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        hintText: "Ex. Salt",
                        hintStyle: TextStyle(
                            fontFamily: "Roboto",
                            color: const Color(0xff54595f63),
                            fontSize: 17.h),
                      ),
                    ),
                  ),
                  sizedBoxWidth(33.w),
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Color(0xffE1E1E1),
                    child: const Text(
                      "-",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  sizedBoxWidth(10.w),
                  SizedBox(
                    height: 45.h,
                    width: 124.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff70707054)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF70707054)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        hintText: "Ex. 1 TBS",
                        hintStyle: TextStyle(
                            fontFamily: "Roboto",
                            color: const Color(0xff54595f63),
                            fontSize: 17.h),
                      ),
                    ),
                  ),
                  sizedBoxWidth(10.w),
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: const Color(0xffE1E1E1),
                    child: const Text(
                      "+",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
              sizedBoxHeight(25.h),
              SizedBox(
                height: 40.h,
                width: 150.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    // ignore: deprecated_member_use
                    primary: const Color.fromRGBO(84, 89, 95, 1),
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                  ),
                  child: Text(
                    "+ Ingredient",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.white,
                      fontSize: 16.sm,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              sizedBoxHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Instructions",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      fontWeight: FontWeight.w500,
                      fontSize: 18.spMin,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ],
              ),
              sizedBoxHeight(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Step 1",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 17.sp,
                        color: Color(0XFF6B6B6B)),
                    // color: AppColors.),
                  ),
                ],
              ),
              sizedBoxHeight(12.h),
              SizedBox(
                height: 68.h,
                child: TextFormField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 8, left: 12),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF707070)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    hintText: "Write your step of recipe here",
                    hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        color: const Color(0xff6B6B6B),
                        fontSize: 14.h),
                    suffixIcon: Image.asset("assets/camera.png"),
                  ),
                ),
              ),
              sizedBoxHeight(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Step 2",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 17.sp,
                        color: Color(0xFF6B6B6B)),
                  ),
                ],
              ),
              sizedBoxHeight(12.h),
              SizedBox(
                height: 68.h,
                child: TextFormField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 8, left: 12),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF707070)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    hintText: "Write your step of recipe here",
                    hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        color: const Color(0xff6B6B6B),
                        fontSize: 14.h),
                    suffixIcon: Image.asset("assets/camera.png"),
                  ),
                ),
              ),
              sizedBoxHeight(29.h),
              SizedBox(
                height: 40.h,
                width: 150.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    // ignore: deprecated_member_use
                    primary: const Color.fromRGBO(84, 89, 95, 1),
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                  ),
                  child: Text(
                    "+ Instructions",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              sizedBoxHeight(25)
            ],
          ),
        ),
      ),
    );
  }
}
