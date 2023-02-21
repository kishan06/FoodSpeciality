import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/reset_password.dart';
import 'package:get/get.dart';

import 'common files/CustomNextButton.dart';
import 'common files/app_bar.dart';

class ForgotPassordScreen extends StatefulWidget {
  ForgotPassordScreen({super.key});

  @override
  State<ForgotPassordScreen> createState() => _ForgotPassordScreenState();
}

class _ForgotPassordScreenState extends State<ForgotPassordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        titleTxt: 'Forgot Password',
        bottomtext: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Please enter your email address.You will \nreceive a link to create a new password via \nemail",
                textAlign: TextAlign.left,
                style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
              ),
              SizedBox(
                height: 37.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Enter Your Email",
                    style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.5.r),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(112, 112, 112, 0.33)),
                      ),
                      border: const OutlineInputBorder(),
                      hintText: "Email Address",
                      hintStyle: TextStyle(
                          fontSize: 17.h,
                          color: const Color.fromRGBO(112, 112, 112, 0.33)),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Image(
                          width: 20.h,
                          height: 17.h,
                          image: const AssetImage("assets/style=linear.png"))),
                ),
              ),
              SizedBox(
                height: 198.h,
              ),
              CustomNextButton(
                ontap: () {
                  Get.toNamed("/resetPass");
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ResetPasswordScreen(),
                  //     ));
                },
                text: 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }
}
