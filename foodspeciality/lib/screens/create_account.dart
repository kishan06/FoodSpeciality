import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';

import 'package:get/get.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String? _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Image.asset(
                "assets/logo.png",
                height: 154.h,
                width: 154.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Create Account",
                style: TextStyle(
                  fontFamily: "StudioProR",
                  fontSize: 30.spMin,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B3F43),
                ),
              ),
              sizedBoxHeight(22.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Join our community of cooks and discover versatile and Existing recipes.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF54595F),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomTextFormField(
                hintText: "Username",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Username';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(value)) {
                    return 'Please enter a valid username (letters and numbers only)';
                  }
                  return null;
                },
                validatorText: "",
                suffixIcon: Image.asset(
                  "assets/user-svgrepo-com.png",
                  height: 20.h,
                  width: 17.w,
                ),
              ),
              // SizedBox(
              //   height: 50.h,
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8.r),
              //           borderSide: BorderSide.none,
              //         ),
              //         hintText: "User Name",
              //         hintStyle: TextStyle(fontSize: 17.h),
              //         filled: true,
              //         fillColor: Colors.white,
              //         suffixIcon: Image(
              //             width: 20.h,
              //             height: 17.h,
              //             image:
              //                 const AssetImage("assets/user-svgrepo-com.png"))),
              //   ),
              // ),

              SizedBox(height: 17.h),
              CustomTextFormField(
                hintText: "Full Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Full Name';
                  }
                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
                validatorText: "",
                suffixIcon: Image.asset(
                  "assets/user-svgrepo-com.png",
                  height: 20.h,
                  width: 17.w,
                ),
              ),
              // SizedBox(
              //   height: 50.h,
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8.r),
              //           borderSide: BorderSide.none,
              //         ),
              //         hintText: "Full Name",
              //         hintStyle: TextStyle(fontSize: 17.h),
              //         filled: true,
              //         fillColor: Colors.white,
              //         suffixIcon: Image(
              //             width: 20.h,
              //             height: 17.h,
              //             image:
              //                 const AssetImage("assets/user-svgrepo-com.png"))),
              //   ),
              // ),

              SizedBox(height: 17.h),
              // SizedBox(
              //   height: 50.h,
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8.r),
              //           borderSide: BorderSide.none,
              //         ),
              //         hintText: "Mobile Number",
              //         hintStyle: TextStyle(fontSize: 17.h),
              //         filled: true,
              //         fillColor: Colors.white,
              //         suffixIcon: Image(
              //             width: 20.h,
              //             height: 17.h,
              //             image: const AssetImage(
              //                 "assets/mobile-svgrepo-com.png"))),
              //   ),
              // ),
              CustomTextFormField(
                texttype: TextInputType.phone,
                hintText: "Mobile Number",
                validator: (value) {
                  if (value == value.isEmpty) {
                    return 'Mobile number is required';
                  } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                      .hasMatch(value)) {
                    return 'Enter valid mobile number';
                  }
                  return null;
                },
                validatorText: "",
                suffixIcon: Image.asset(
                  "assets/mobile-svgrepo-com.png",
                  height: 20.h,
                  width: 17.w,
                ),
              ),
              SizedBox(height: 17.h),
              CustomTextFormField(
                hintText: "Email Address",
                validator: (value) {
                  if (value == value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                validatorText: "",
                suffixIcon: Image.asset(
                  "assets/style=linear.png",
                  height: 20.h,
                  width: 17.w,
                ),
              ),
              // SizedBox(
              //   height: 50.h,
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8.r),
              //           borderSide: BorderSide.none,
              //         ),
              //         hintText: "Email",
              //         hintStyle: TextStyle(fontSize: 17.h),
              //         filled: true,
              //         fillColor: Colors.white,
              //         suffixIcon: Image(
              //             width: 20.h,
              //             height: 17.h,
              //             image: const AssetImage("assets/style=linear.png"))),
              //   ),
              // ),

              SizedBox(height: 17.h),
              // SizedBox(
              //   height: 50.h,
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8.r),
              //           borderSide: BorderSide.none,
              //         ),
              //         hintText: "Password",
              //         filled: true,
              //         hintStyle: TextStyle(fontSize: 17.h),
              //         fillColor: Colors.white,
              //         suffixIcon: Image(
              //             width: 20.h,
              //             height: 17.h,
              //             image: const AssetImage(
              //                 "assets/password-svgrepo-com (1).png"))),
              //     obscureText: true,
              //   ),
              // ),
              CustomTextFormField(
                hintText: "Password",
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
                isInputPassword: true,
              ),

              SizedBox(height: 17.h),
              // SizedBox(
              //   height: 50.h,
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(8.r),
              //           borderSide: BorderSide.none,
              //         ),
              //         hintText: "Confirm Password",
              //         hintStyle: TextStyle(fontSize: 17.h),
              //         filled: true,
              //         fillColor: Colors.white,
              //         suffixIcon: Image(
              //             width: 20.h,
              //             height: 17.h,
              //             image: const AssetImage(
              //                 "assets/password-svgrepo-com (1).png"))),
              //   ),
              // ),
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
                isInputPassword: true,
              ),

              SizedBox(height: 21.h),
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/signUpProfile");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(color: Colors.white, width: 1.w),
                    ),
                    elevation: 0,
                    primary: const Color.fromRGBO(84, 89, 95, 1),
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.spMin,
                        fontFamily: "StudioProR"),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(color: Color(0xFF3B3F43), width: 1.w),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/google-svgrepo-com.svg",
                        height: 28.h,
                        width: 28.w,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                            fontSize: 18.sp, color: Color(0xFF3B3F43)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                        color: Color(0xFF3B3F43),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/login");
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFF3B3F43),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto",
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
