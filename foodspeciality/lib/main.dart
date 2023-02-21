import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/login_screen.dart';
import 'package:foodspeciality/screens/splash_screen2.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 930),
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: LoginScreen(),  title: 'FreeU',
        initialRoute: '/',
        getPages: [
          GetPage(
            name: '/',
            page: () => LoginScreen(),
          ),
        ],
      ),
    );
  }
}
