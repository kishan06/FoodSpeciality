import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/common_elevatd_button.dart';

class DiscoveryRecipesScreen extends StatefulWidget {
  DiscoveryRecipesScreen({super.key});

  @override
  State<DiscoveryRecipesScreen> createState() => _DiscoveryRecipesScreenState();
}

class _DiscoveryRecipesScreenState extends State<DiscoveryRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Text(
                  "Discovery Recipes",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 25.h,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF54595F)),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  "Add your cuisine preference of choice and\ndiscover versitile and exciting recipes!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16.sp,
                      color: Color.fromRGBO(112, 112, 112, 1)),
                ),
              ),
              SizedBox(
                height: 37.h,
              ),
              Container(
                height: 50.h,
                width: 250.w,
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                    child: Text(
                  "South Africa Cuisine",
                  style: TextStyle(
                      color: Color(0xFF414141),
                      fontFamily: "StudioProR",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CommonElevatedButton(text: "Limpopo"),
                          SizedBox(
                            width: 15.w,
                          ),
                          CommonElevatedButton(text: "Mpumalanga"),
                          SizedBox(
                            width: 15.w,
                          ),
                          CommonElevatedButton(text: "North West"),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          CommonElevatedButton(text: "Free-State"),
                          SizedBox(
                            width: 15.w,
                          ),
                          CommonElevatedButton(text: "Eastern Cape"),
                          SizedBox(
                            width: 15.w,
                          ),
                          CommonElevatedButton(text: "Western Cape"),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          CommonElevatedButton(text: "KwaZulu-Natal"),
                          SizedBox(
                            width: 15.w,
                          ),
                          CommonElevatedButton(text: "Northern Cape"),
                          SizedBox(
                            width: 15.w,
                          ),
                          CommonElevatedButton(text: "Gauteng"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 50.h,
                width: 250.w,
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                    child: Text(
                  "International Cuisine",
                  style: TextStyle(
                      color: Color(0xFF414141),
                      fontFamily: "StudioProR",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CommonElevatedButton(text: "Indian"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Japanese"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Italian"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        CommonElevatedButton(text: "Mexican"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Portuguese"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Moroccan"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        CommonElevatedButton(text: "Chinese"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "American"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Thai"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        CommonElevatedButton(text: "German"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "French"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Spanish"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 50.h,
                width: 250.w,
                decoration: BoxDecoration(
                  color: Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Others",
                      style: TextStyle(
                          color: Color(0xFF414141),
                          fontFamily: "StudioProR",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CommonElevatedButton(text: "Make it yum !"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Quarter too quick"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        CommonElevatedButton(text: "Juicy Mondays"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "The healthy way"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        CommonElevatedButton(text: "Fry – day!"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "The future of Tradition"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        CommonElevatedButton(text: "Simple greens"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Deliciously diverse"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        CommonElevatedButton(text: "Meals for one!"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Get your veg on"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        CommonElevatedButton(text: "From pizza, with love"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Follow the flavours"),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        CommonElevatedButton(text: "Good mood food"),
                        SizedBox(
                          width: 15.w,
                        ),
                        CommonElevatedButton(text: "Make it Shhhnacky!"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 64.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomNextButton(text: "Next"),
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
