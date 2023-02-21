import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common files/CustomNextButton.dart';
import 'common files/app_bar.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        titleTxt: 'Reset Password',
        bottomtext: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter New Password and Confirm.",
                textAlign: TextAlign.left,
                style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
              ),
              SizedBox(
                height: 77.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "New Password",
                    style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
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
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontSize: 17.h,
                          color: const Color.fromRGBO(112, 112, 112, 0.33)),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Image(
                          width: 20.h,
                          height: 17.h,
                          image: const AssetImage(
                              "assets/password-svgrepo-com (1).png"))),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "New Password",
                    style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
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
                      hintText: "Password",
                      hintStyle: TextStyle(
                          fontSize: 17.h,
                          color: const Color.fromRGBO(112, 112, 112, 0.33)),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Image(
                          width: 20.h,
                          height: 17.h,
                          image: const AssetImage(
                              "assets/password-svgrepo-com (1).png"))),
                ),
              ),
              SizedBox(
                height: 95.h,
              ),
              const CustomNextButton(
                text: 'Change Password',
              )
            ],
          ),
        ),
      ),
    );
  }
}
