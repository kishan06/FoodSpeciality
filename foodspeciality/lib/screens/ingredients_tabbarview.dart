import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class IngredientsTabbatview extends StatefulWidget {
  const IngredientsTabbatview({super.key});

  @override
  State<IngredientsTabbatview> createState() => _IngredientsTabbatviewState();
}

class _IngredientsTabbatviewState extends State<IngredientsTabbatview> {
  List<Widget> widgetsInColumn = [];
  List<Widget> stepsInColumn = [];
  int number = 1;
  int _TBS = 1;
  final TextEditingController _TEC = TextEditingController();
  int servigCount = 0;

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
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(_servings());
                      },
                      child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side:
                                    const BorderSide(color: Color(0xff707070)),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          height: 45.h,
                          width: 116.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$servigCount",
                                style: const TextStyle(
                                    fontFamily: "Roboto", fontSize: 20),
                              ),
                              const Text(
                                " Min",
                                style: TextStyle(
                                    fontFamily: "Roboto", fontSize: 15),
                              ),
                              sizedBoxWidth(1),
                            ],
                          )),
                    ),
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
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(_servings());
                      },
                      child: Container(
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
                            Text(
                              " $servigCount Serving",
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: "Roboto"),
                            ),
                            sizedBoxWidth(1),
                          ],
                        ),
                      ),
                    ),
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
              _recipeDetails(),
              Column(
                children: widgetsInColumn,
              ),
              // ListView(
              //   children: widgetsInColumn,
              // ),
              sizedBoxHeight(13.h),
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
                  onPressed: () {
                    setState(() {
                      widgetsInColumn.add(_recipeDetails());
                    });
                  },
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
              // _instructionSteps(),
              Column(
                children: stepsInColumn,
              ),

              sizedBoxHeight(14.h),
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
                  onPressed: () {
                    setState(() {
                      stepsInColumn.add(_instructionSteps());
                      number++;
                    });
                  },
                ),
              ),
              sizedBoxHeight(25)
            ],
          ),
        ),
      ),
    );
  }

  Widget _recipeDetails() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 45.h,
              width: 155.w,
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
                  hintText: "Ex. Salt",
                  hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color(0xff54595f63),
                      fontSize: 17.h),
                ),
              ),
            ),
            sizedBoxWidth(33.w),
            GestureDetector(
              onTap: () {
                setState(() {
                  _TBS--;
                });
              },
              child: CircleAvatar(
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
            ),
            sizedBoxWidth(10.w),
            SizedBox(
              height: 45.h,
              width: 124.w,
              child: TextFormField(
                controller: _TEC,
                // initialValue: '$_TBS',
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff70707054)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF70707054)),
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
            GestureDetector(
              onTap: () {
                setState(() {
                  _TBS++;
                });
              },
              child: CircleAvatar(
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
              ),
            )
          ],
        ),
        sizedBoxHeight(13.h),
      ],
    );
  }

  Widget _instructionSteps() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Step $number",
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
      ],
    );
  }

  Widget _servings() {
    return BottomSheet(
      builder: (context) {
        return SizedBox(
          height: 200.0,
          child: CupertinoPicker(
            itemExtent: 32.0,
            onSelectedItemChanged: (int value) {
              setState(() {
                servigCount = value;
              });
            },
            children: List<Widget>.generate(100, (int index) {
              return Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 20, fontFamily: "Roboto"),
                ),
              );
            }),
          ),
        );
      },
      onClosing: () {
        Get.back();
      },
    );
  }
}
