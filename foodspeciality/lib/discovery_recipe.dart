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
                    fontSize: 30.h,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(84, 89, 95, 1)),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            const Center(
              child: Text(
                "Add your cuisine preference of choice and \ndiscover versitile and exciting recipes!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width.w / 2,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.r),
                      bottomRight: Radius.circular(25.r),
                    ),
                    side: BorderSide(color: Colors.white, width: 1.w),
                  ),
                  elevation: 0,
                  primary: const Color.fromRGBO(235, 235, 235, 1),
                  onPrimary: const Color.fromRGBO(84, 89, 95, 1),
                ),
                child: Text(
                  'South Africa Cuisine',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.h),
                ),
              ),
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
            SizedBox(
              width: MediaQuery.of(context).size.width.w / 2,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.r),
                      bottomRight: Radius.circular(25.r),
                    ),
                    side: BorderSide(color: Colors.white, width: 1.w),
                  ),
                  elevation: 0,
                  primary: const Color.fromRGBO(235, 235, 235, 1),
                  onPrimary: const Color.fromRGBO(84, 89, 95, 1),
                ),
                child: Text(
                  'International Cuisine',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.h),
                ),
              ),
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
                  CommonElevatedButton(text: "Turkish"),
                ],
              ),
            ),
            SizedBox(
              height: 93.h,
            ),
            const CustomNextButton(text: "Next")
          ],
        ),
      ),
    );
  }
}
