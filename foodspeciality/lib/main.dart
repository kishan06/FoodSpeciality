import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/login_screen.dart';
import 'package:foodspeciality/screens/splash_screen2.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 930),
      builder: (BuildContext context, Widget? child) => 
      const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginScreen(),
        home: SplashScreen2(),
      ),
    );
  }
}
