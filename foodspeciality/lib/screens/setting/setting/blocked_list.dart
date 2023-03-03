import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:lottie/lottie.dart';

class BlockedList extends StatelessWidget {
  const BlockedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleTxt: "Blocked List"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "These are the people you have blocked. They can't \ncommunicate with you on food specialities",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      color: const Color(0xff979797)),
                ),
              ],
            ),
            sizedBoxHeight(47.h),
            Lottie.asset("assets/setting svg/79572.json"),
            sizedBoxHeight(58.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Block List Empty",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
