import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                      fontSize: 30.spMin,
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
                          color: Color(0xFF54595F),
                          fontSize: 15.sp,
                          fontFamily: "Roboto"),
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
                  //             image:
                  //                 const AssetImage("assets/style=linear.png"))),
                  //   ),
                  // ),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    hintText: "Password",
                    validatorText: "", isInputPassword: true,
                    // suffixIcon: Padding(
                    //   padding: const EdgeInsets.only(right: 8.0),
                    //   child: Icon(
                    //     Icons.lock_outline,
                    //     color: Color(0xFF54595F),
                    //   ),
                    // ),
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
                            fontFamily: "Roboto",
                            color: Color(0xFF3B3F43),
                            fontSize: 16.spMin,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/bottomBar');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(84, 89, 95, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          // side: BorderSide(color: Colors.white, width: 1.w),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 18.sp, fontFamily: "StudioProR"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          side:
                              BorderSide(color: Color(0xFF3B3F43), width: 1.w),
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
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                            color: Color(0xFF3B3F43),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/createAcc");
                        },
                        child: Text(
                          "Create account",
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
                  // SizedBox(
                  //   height: 50.h,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Get.toNamed("/createAcc");
                  //       // Navigator.push(
                  //       //     context,
                  //       //     MaterialPageRoute(
                  //       //       builder: (context) => CreateAccountScreen(),
                  //       //     ));
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25.r),
                  //         side:
                  //             BorderSide(color: Color(0xFF3B3F43), width: 1.w),
                  //       ),
                  //       elevation: 0,
                  //       primary: Colors.transparent,
                  //       onPrimary: Colors.white,
                  //     ),
                  //     child: Text(
                  //       'Create Account',
                  //       style: TextStyle(fontSize: 16.sp),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }
}
