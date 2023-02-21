import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/utils/colors.dart';

Widget textWhite24BoldRobo(String title){
  return Text(title,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.white,
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "Roboto"
    ),
  );
}

Widget textgrey22BoldRobo(String title){
  return Text(title,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.buttonGrey54595F,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "Roboto"
    ),
  );
}

Widget textL_grey14Robo(String title){
  return Text(title,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.grey707070,
      fontSize: 14.sp,
      // fontWeight: FontWeight.bold,
      fontFamily: "Roboto"
    ),
  );
}

Widget textWhite14Robo(String title){
  return Text(title,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.white,
      fontSize: 14.sp,
      // fontWeight: FontWeight.bold,
      fontFamily: "Roboto"
    ),
  );
}

Widget textWhite18Robo(String title){
  return Text(title,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: AppColors.white,
      fontSize: 18.sp,
      // fontWeight: FontWeight.bold,
      fontFamily: "Roboto"
    ),
  );
}

Widget textWhite16RoboBold(String title){
  return Text(title,
    textAlign: TextAlign.center,
    style: TextStyle(
      decoration: TextDecoration.underline,
      color: AppColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "Roboto"
    ),
  );
}

