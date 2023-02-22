import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 55.h,
                  ),
                  Image.asset(
                    "assets/logo.png",
                    height: 154.h,
                    width: 154.w,
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 24.spMin,
                      fontFamily: "StudoProR",
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B3F43),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Food Specialities is committed to bringing you versatile and exciting choices for your daily food and cooking experience!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF54595F), fontSize: 14.spMin),
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  CustomTextFormField(
                    hintText: "Email Address",
                    validatorText: "",
                    suffixIcon: Image.asset(
                      "assets/style=linear.png",
                      color: Color(0xFF54595F),
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
                  //             image:
                  //                 const AssetImage("assets/style=linear.png"))),
                  //   ),
                  // ),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    hintText: "Email Address",
                    validatorText: "",
                    suffixIcon: Icon(
                      Icons.lock_outline,
                      color: Color(0xFF54595F),
                    ),
                  ),
                  // SizedBox(
                  //   height: 50.h,
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8.r),
                  //         borderSide: BorderSide.none,
                  //       ),
                  //       hintText: "Password",
                  //       filled: true,
                  //       hintStyle: TextStyle(fontSize: 17.h),
                  //       fillColor: Colors.white,
                  //       suffixIcon: const Icon(
                  //         Icons.lock_outline,
                  //         color: Colors.black54,
                  //       ),
                  //     ),
                  //     obscureText: true,
                  //   ),
                  // ),

                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/forgetPass");
                          // Get.back();
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 105.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/viewuser');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          side: BorderSide(color: Colors.white, width: 1.w),
                        ),
                        elevation: 0,
                        primary: const Color.fromRGBO(84, 89, 95, 1),
                        onPrimary: Colors.white,
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.h),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/createAcc");
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => CreateAccountScreen(),
                        //     ));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                          side: BorderSide(color: Colors.white, width: 1.w),
                        ),
                        elevation: 0,
                        primary: Colors.transparent,
                        onPrimary: Colors.white,
                      ),
                      child: Text(
                        'Create Account',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
