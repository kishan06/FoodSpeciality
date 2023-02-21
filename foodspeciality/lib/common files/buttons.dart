import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/common%20files/texts.dart';
import 'package:foodspeciality/utils/colors.dart';

Widget customButtonWithBorder(String text,{required void Function()? onPressed}){
  return SizedBox(
    height: 50.h,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: AppColors.buttonGrey54595F,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.white,
            width: 1.w
          ),
          borderRadius: BorderRadius.circular(25.h),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textWhite18Robo(text),

          sizedBoxWidth(20.w),

          Image.asset("assets/icons/next-right-arrow-svgrepo-com (1).png",
            height: 18.h,
            width: 18.h,
          )
        ],
      ),
      onPressed: onPressed
    ),
  );

}


Widget customButton(String text,{required void Function()? onPressed}){
  return SizedBox(
    height: 50.h,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: AppColors.buttonGrey54595F,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.h),
        ),
      ),
      child: textWhite18Robo(text),
      onPressed: onPressed
    ),
  );

}
