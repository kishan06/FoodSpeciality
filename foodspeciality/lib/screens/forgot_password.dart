import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';
import 'package:foodspeciality/common%20files/app_bar.dart';
import 'package:foodspeciality/common%20files/customtextformfield.dart';
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
                    fontSize: 16.sm,
                    fontFamily: "Roboto"),
              ),
              SizedBox(
                height: 31.h,
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
                height: 10.h,
              ),
              CustomTextFormField(
                hintText: "Email Address",
                validatorText: "",
                suffixIcon: Icon(Icons.email_outlined),
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
