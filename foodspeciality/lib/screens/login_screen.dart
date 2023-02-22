import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                "Food Specialities is committed to bringing you versatile and exciting choices for your daily food and cooking experience!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 29.h,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 104.h,
            ),
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
            SizedBox(height: 29.h),
            SizedBox(
              height: 50.h,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Password",
                  filled: true,
                  hintStyle: TextStyle(fontSize: 17.h),
                  fillColor: Colors.white,
                  suffixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.black54,
                  ),
                ),
                obscureText: true,
              ),
            ),
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
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.h),
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            SizedBox(
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
    ));
  }
}
