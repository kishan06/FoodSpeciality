import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/ViewModel/GoogleSigninApi.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/constants/base_manager.dart';
import 'package:foodspeciality/services/auth_service.dart';
import 'package:foodspeciality/services/googleAuthService.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/auth_controller.dart';
import '../utils/colors.dart';

class CreateAccountScreenViaOAuth extends StatefulWidget {
  CreateAccountScreenViaOAuth({super.key});

  @override
  State<CreateAccountScreenViaOAuth> createState() =>
      _CreateAccountScreenViaOAuthState();
}

class _CreateAccountScreenViaOAuthState
    extends State<CreateAccountScreenViaOAuth> {
  // Authcon
  AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController tecUserName = TextEditingController();
  TextEditingController tecFirstName = TextEditingController();
  TextEditingController tecLastName = TextEditingController();
  TextEditingController tecMobileNo = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  AuthService authService = AuthService();

 

  Future<void> _submit() async {
    final FormState? form = _formKey.currentState;
    if (form != null && form.validate()) {
      Map<String, dynamic> updata = {
        "username": tecUserName.text,
        "email": tecEmail.text,
        "phone": tecMobileNo.text,
        "ID": idTokenGoogleSignin,
        "first_name": tecFirstName.text,
        "last_name": tecLastName.text
      };
      final data = await GoogleSigninApi().googleSigninApi(updata);

      if (data.status == ResponseStatus.SUCCESS) {
        // Get.toNamed("/bottomBar");
        getAccountCreatedDailog();
      }
      // bool boolValue = await authService.signUpUser(
      //   username: tecUserName.text,
      //   first_name: tecFirstName.text,
      //   last_name: tecLastName.text,
      //   phone: tecMobileNo.text,
      //   email: tecEmail.text,
      // );
      // print(boolValue);
      // if (boolValue) {
      //   getAccountCreatedDailog();
      // }
    }
  }

  // showDailog(){
  //   authService.accountCreatedDialog(context);
  // }
  // bool v1 = false;
  // bool v2 = false;
  // bool v3 = false;
  // bool v4 = false;
  // bool v5 = false;
  // bool v6 = false;
  @override
  void initState() {
    tecUserName.text = userName ?? "";
    tecEmail.text = emailAddress ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   key: _myKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      color: const Color(0xFF3B3F43),
                    ),
                  ),
                  sizedBoxHeight(22.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Text(
                      "Join our community of cooks and discover versatile and Existing recipes.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xFF54595F),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomTextFormField(
                    textEditingController: tecUserName,
                    hintText: "Username",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Username';
                      }
                      if (!RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(value)) {
                        return 'Please enter a valid username (letters and numbers only)';
                      }
                      // v1 = true;
                      return null;
                    },
                    validatorText: "",
                    suffixIcon: Image.asset(
                      "assets/user-svgrepo-com.png",
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 17.h),
                  CustomTextFormField(
                    textEditingController: tecFirstName,
                    hintText: "First Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your First Name';
                      }
                      if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                        return 'Please enter a valid name';
                      }
                      // v2 = true;
                      return null;
                    },
                    validatorText: "",
                    suffixIcon: Image.asset(
                      "assets/user-svgrepo-com.png",
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 17.h),
                  CustomTextFormField(
                    textEditingController: tecLastName,
                    hintText: "Last Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Last Name';
                      }
                      if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                        return 'Please enter a valid name';
                      }
                      // v2 = true;
                      return null;
                    },
                    validatorText: "",
                    suffixIcon: Image.asset(
                      "assets/user-svgrepo-com.png",
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 17.h),
                  CustomTextFormField(
                    textEditingController: tecMobileNo,
                    texttype: TextInputType.phone,
                    hintText: "Mobile Number",
                    validator: (value) {
                      if (value == value.isEmpty) {
                        return 'Mobile number is required';
                      } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10}$)')
                          .hasMatch(value)) {
                        return 'Enter valid mobile number';
                      }
                      // v3 = true;
                      return null;
                    },
                    validatorText: "",
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    suffixIcon: Image.asset(
                      "assets/mobile-svgrepo-com.png",
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 17.h),
                  CustomTextFormField(
                    textEditingController: tecEmail,
                    hintText: "Email Address",
                    validator: (value) {
                      if (value == value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      // v4 = true;
                      return null;
                    },
                    validatorText: "",
                    suffixIcon: Image.asset(
                      "assets/style=linear.png",
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 21.h),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _submit();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          side: BorderSide(color: Colors.white, width: 1.w),
                        ),
                        backgroundColor: const Color.fromRGBO(84, 89, 95, 1),
                        elevation: 0,
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
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                            color: const Color(0xFF3B3F43),
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
                            color: const Color(0xFF3B3F43),
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
        ),
      ),
    );
  }

  accountCreatedDialog(BuildContext context) async {
    print("show dailog");
    // AppDataController appDataController = Get.find();
    // await Future.delayed(Duration(milliseconds: 10));
    showDialog(
      context: context,
      barrierDismissible: false,
      // barrierColor: Colors.black.withOpacity(0.9),
      // ColorConstants.kBlack.withOpacity(0.9),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 20, 20),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Positioned(
                      //   top: -80,
                      //   left: 0,
                      //   right: 0,
                      //   child: Align(
                      //     alignment: Alignment.center,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(100),
                      //       ),
                      //       width: 100,
                      //       height: 100,
                      //       child: appDataController.profilePicUrl.value.isEmpty
                      //           ? CircleAvatar(
                      //               backgroundColor: ColorConstants.kPrimaryColor,
                      //               child: const Icon(
                      //                 Icons.person_rounded,
                      //                 size: 52,
                      //                 color: Colors.black,
                      //               ),
                      //             )
                      //           : CircleAvatar(
                      //               backgroundImage: NetworkImage(
                      //                   appDataController.profilePicUrl.value),
                      //             ),
                      //     ),
                      //   ),
                      // ),

                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.close,
                                color: AppColors.grey54595F,
                                // ColorConstants.kPrimaryColor,
                                size: 25,
                              ),
                            ),
                          ),
                          // const SizedBox(height: 30),

                          LottieBuilder.network(
                            "https://assets6.lottiefiles.com/packages/lf20_touohxv0.json",
                            // height: ,
                            height: 250,
                            width: 200,
                          ),

                          const Text(
                            "Congratulations",
                            style: TextStyle(
                              fontSize: 25,
                              color: AppColors.greyD3B3F43,
                              // ColorConstants.kPrimaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          const Text(
                            "bhb",
                            // HomeApiController().setMoodResponse,
                            // homeApiController.setMoodResponse.progressBar!,
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xffD9D9D9),
                            ),
                          ),

                          // TextSpan(
                          //         text: appDataController.name.value,
                          //         style: TextStyle(
                          //           fontSize: 17,
                          //           color: ColorConstants.kPrimaryColor,
                          //           fontWeight: FontWeight.w500,
                          //         ),
                          //       )

                          // const SizedBox(height: 34),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  getAccountCreatedDailog() {
    Get.defaultDialog(
        titleStyle: const TextStyle(fontSize: 0),
        titlePadding: const EdgeInsets.all(0),
        contentPadding: EdgeInsets.all(10.h),
        title: "",
        barrierDismissible: false,
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: GestureDetector(
                  //     onTap: (){
                  //       Get.back();
                  //     },
                  //     child: Icon(Icons.close,
                  //       color: AppColors.grey54595F,
                  //       // ColorConstants.kPrimaryColor,
                  //       size: 25.h,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 30),

                  LottieBuilder.network(
                    "https://assets3.lottiefiles.com/packages/lf20_jbrw3hcz.json",
                    // height: ,
                    height: 200.h,
                    width: 250.w,
                  ),

                  Text(
                    "Congratulations",
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: AppColors.greyD3B3F43,
                      // ColorConstants.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Account Created Successfully",
                    // HomeApiController().setMoodResponse,
                    // homeApiController.setMoodResponse.progressBar!,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.greyD3B3F43,
                    ),
                  ),

                  sizedBoxHeight(30.h),

                  SizedBox(
                    height: 50.h,
                    width: 170.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        // ignore: deprecated_member_use
                        primary: const Color(0xFF3B3F43),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xFF707070)),
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: 'StudioProR',
                        ),
                      ),
                      onPressed: () {
                        Get.offAndToNamed("/bottomBar");
                        //  Get.offAllNamed("/login");
                        // Get.toNamed("communityaddparticipants");
                      },
                    ),
                  ),

                  // custom

                  // TextSpan(
                  //         text: appDataController.name.value,
                  //         style: TextStyle(
                  //           fontSize: 17,
                  //           color: ColorConstants.kPrimaryColor,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       )

                  // custom

                  // const SizedBox(height: 34),
                ],
              ),
            ],
          ),
        ));
  }
}
