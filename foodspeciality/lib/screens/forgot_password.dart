import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        titleTxt: 'Forgot Password',
        bottomtext: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please enter your email address.You will \nreceive a link to create a new password via \nemail",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontSize: 17.sp,
                    fontFamily: "Roboto"),
              ),
              SizedBox(
                height: 31.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  // Text(
                  //   "Enter Your Email",
                  //   style: textformstyle(""),
                  // ),
                  Text(
                    "Enter Your Email",
                    style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
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
              SizedBox(
                height: 198.h,
              ),

              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/otpverification");
                    // Get.toNamed('/signUpProfile');
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
                    'Next',
                    style: TextStyle(
                        fontSize: 18.sp, fontFamily: "StudioProR"),
                  ),
                ),
              ),
            
              // CustomNextButton(
              //   ontap: () {
              //     Get.toNamed("/otpverification");
              //     // Navigator.push(
              //     //     context,
              //     //     MaterialPageRoute(
              //     //       builder: (context) => ResetPasswordScreen(),
              //     //     ));
              //   },
              //   text: 'Next',
              // )
            ],
          ),
        ),
      ),
    );
  }
}
