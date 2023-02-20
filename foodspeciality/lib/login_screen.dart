import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/CustomNextButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            image: AssetImage("assets/28 crop.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/Artboard 1.png")),
              SizedBox(
                height: 29.h,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 41),
                child: Text(
                  "Food Specialities is committed to bringing you versatile and exciting choices for your daily food and cooking experience!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              const Image(image: AssetImage("assets/Sign In.png")),
              SizedBox(
                height: 108.h,
              ),
              Stack(
                children: const [
                  Image(image: AssetImage("assets/Rectangle 5348.png")),
                  Image(image: AssetImage("assets/Email.png")),
                  Image(image: AssetImage("assets/style=linear.png")),
                ],
              ),
              SizedBox(
                height: 29.h,
              ),
              Stack(
                children: const [
                  Image(image: AssetImage("assets/Rectangle 5348.png")),
                  Image(image: AssetImage("assets/Password.png")),
                  Image(
                      image: AssetImage("assets/password-svgrepo-com (1).png")),
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              const Image(image: AssetImage("assets/Forgot Password.png")),
              SizedBox(
                height: 105.h,
              ),
              const CustomNextButton(
                text: 'Sign In',
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                child: Stack(
                  children: [
                    // SvgPicture.asset("assets/svg/Rectangle 5351.svg"),
                    const Center(
                      child: Text("Create account",
                          style: TextStyle(color: Colors.white)),
                    ),
                    SvgPicture.asset(
                      "assets/svg/Create account.svg",
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
