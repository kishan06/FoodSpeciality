import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String? _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        titleTxt: 'Reset Password',
        bottomtext: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Enter New Password and Confirm.",
                //   textAlign: TextAlign.left,
                //   style: TextStyle(
                //       color: Color.fromRGBO(112, 112, 112, 1),
                //       fontSize: 16.sm,
                //       fontFamily: "Roboto"),
                // ),
                SizedBox(
                  height: 77.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    // Text(
                    //   "New Password",
                    //   style: TextStyle(
                    //       color: Color.fromRGBO(112, 112, 112, 1),
                    //       fontSize: 14.sm,
                    //       fontFamily: "Roboto"),
                    // ),
                    Text("New Password")
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                    hintText: "New Password",
                    validator: (value) {
                      if (value == value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      _password = value;
                      return null;
                    },
                    validatorText: "",
                    isInputPassword: true),
                // SizedBox(
                //   height: 50.h,
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(7.5.r),
                //           borderSide: const BorderSide(
                //               color: Color.fromRGBO(112, 112, 112, 0.33)),
                //         ),
                //         border: const OutlineInputBorder(),
                //         hintText: "Password",
                //         hintStyle: TextStyle(
                //             fontSize: 17.h,
                //             color: const Color.fromRGBO(112, 112, 112, 0.33)),
                //         filled: true,
                //         fillColor: Colors.white,
                //         suffixIcon: Image(
                //             width: 20.h,
                //             height: 17.h,
                //             image: const AssetImage(
                //                 "assets/password-svgrepo-com (1).png"))),
                //   ),
                // ),

                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    // Text(
                    //   "Confirm Password",
                    //   style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
                    // ),
                    Text("Confirm Password")
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                    hintText: "Confirm Password",
                    validator: (value) {
                      if (value == value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value != _password) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    validatorText: "",
                    isInputPassword: true),
                // SizedBox(
                //   height: 50.h,
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(7.5.r),
                //           borderSide: const BorderSide(
                //               color: Color.fromRGBO(112, 112, 112, 0.33)),
                //         ),
                //         border: const OutlineInputBorder(),
                //         hintText: "Password",
                //         hintStyle: TextStyle(
                //             fontSize: 17.h,
                //             color: const Color.fromRGBO(112, 112, 112, 0.33)),
                //         filled: true,
                //         fillColor: Colors.white,
                //         suffixIcon: Image(
                //             width: 20.h,
                //             height: 17.h,
                //             image: const AssetImage(
                //                 "assets/password-svgrepo-com (1).png"))),
                //   ),
                // ),

                SizedBox(
                  height: 95.h,
                ),
                CustomNextButton(
                  text: 'Change Password',
                  ontap: () {
                    Get.toNamed("/login");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
