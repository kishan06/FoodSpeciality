import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/signup_profile.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/28 crop.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
              ),
              const Image(image: AssetImage("assets/Artboard 1.png")),
              SizedBox(
                height: 29.h,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Join our community of cooks and discover versatile and Existing recipes.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 29.h,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "User Name",
                      hintStyle: TextStyle(fontSize: 17.h),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Image(
                          width: 20.h,
                          height: 17.h,
                          image:
                              const AssetImage("assets/user-svgrepo-com.png"))),
                ),
              ),
              SizedBox(height: 17.h),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Full Name",
                      hintStyle: TextStyle(fontSize: 17.h),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Image(
                          width: 20.h,
                          height: 17.h,
                          image:
                              const AssetImage("assets/user-svgrepo-com.png"))),
                ),
              ),
              SizedBox(height: 17.h),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(fontSize: 17.h),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Image(
                          width: 20.h,
                          height: 17.h,
                          image: const AssetImage(
                              "assets/mobile-svgrepo-com.png"))),
                ),
              ),
              SizedBox(height: 17.h),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 17.h),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Image(
                          width: 20.h,
                          height: 17.h,
                          image: const AssetImage("assets/style=linear.png"))),
                ),
              ),
              SizedBox(height: 17.h),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Password",
                      filled: true,
                      hintStyle: TextStyle(fontSize: 17.h),
                      fillColor: Colors.white,
                      suffixIcon: Image(
                          width: 20.h,
                          height: 17.h,
                          image: const AssetImage(
                              "assets/password-svgrepo-com (1).png"))),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              SizedBox(
                height: 50.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(fontSize: 17.h),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Image(
                          width: 20.h,
                          height: 17.h,
                          image: const AssetImage(
                              "assets/password-svgrepo-com (1).png"))),
                ),
              ),
              SizedBox(height: 31.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/signUpProfile");
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.h),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
