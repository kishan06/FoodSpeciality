import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/login.dart';
import 'package:foodspeciality/screens/InsideBottomBar/profile.dart';
import 'package:foodspeciality/screens/Inspiration_recipe_comment.dart';
import 'package:foodspeciality/screens/bottom_bar.dart';
import 'package:foodspeciality/screens/communityAddparticipants.dart';
import 'package:foodspeciality/screens/create_account.dart';
import 'package:foodspeciality/screens/discovery_recipe.dart';
import 'package:foodspeciality/screens/edit_profile.dart';
import 'package:foodspeciality/screens/followUser.dart';
import 'package:foodspeciality/screens/forgot_password.dart';
import 'package:foodspeciality/screens/join_challenge.dart';
import 'package:foodspeciality/screens/onboarding/onboarding.dart';
import 'package:foodspeciality/screens/otpScreen.dart';
import 'package:foodspeciality/screens/reset_password.dart';
import 'package:foodspeciality/screens/search_page.dart';
import 'package:foodspeciality/screens/setting/setting/setting.dart';
import 'package:foodspeciality/screens/signup_profile.dart';
import 'package:foodspeciality/screens/splash_screen2.dart';
import 'package:foodspeciality/screens/user_notification.dart';
import 'package:foodspeciality/screens/viewUser.dart';
import 'package:get/get.dart';

import 'common files/video_player_network.dart';
import 'screens/InsideBottomBar/chats/Screens/ChatCommunityDetail.dart';
import 'screens/report.dart';
import 'screens/report_successfull.dart';

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
          //SplashScreen2()
          GetPage(name: '/', page: () => SplashScreen2()),
          GetPage(name: "/onboard", page: () => OnBoarding()),
          GetPage(name: "/login", page: () => Login()),
          GetPage(name: "/forgetPass", page: () => ForgotPassword()),
          GetPage(name: "/otpverification", page: () => otpVerification()),
          GetPage(name: "/createAcc", page: () => CreateAccountScreen()),
          GetPage(name: "/resetPass", page: () => ResetPassword()),
          GetPage(name: "/signUpProfile", page: () => SignupProfile()),
          GetPage(
              name: "/discoveryRecipes", page: () => DiscoveryRecipesScreen()),
          GetPage(name: "/viewuser", page: () => viewUser()),
          GetPage(name: "/followuser", page: () => followUser()),
          GetPage(name: "/bottomBar", page: () => BottomBar()),
          GetPage(
              name: "/communityaddparticipants",
              page: () => communityAddParticipants()),
          GetPage(
              name: "/chatcommunitydetail", page: () => ChatCommunityDetail()),
          GetPage(name: "/myProfile", page: () => myProfile()),
          GetPage(
              name: "/networkplayerwidget", page: () => NetworkPlayerWidget()),
          GetPage(name: "/setting", page: () => Setting()),
          GetPage(name: "/joinchallenge", page: () => JoinChallenge()),
          GetPage(name: "/notification", page: () => UserNotifications()),
          GetPage(name: "/EditProfile", page: () => EditProfile()),
          GetPage(name: "/Report", page: () => Report()),
          GetPage(name: "/ReportSuccess", page: () => ReportSuccess()),
          GetPage(
              name: "/InspirationRecipeComment",
              page: () => InspirationRecipeComment()),

          GetPage(name: "/SearchPage", page: () => SearchPage()),
        ],
      ),
    );
  }
}
