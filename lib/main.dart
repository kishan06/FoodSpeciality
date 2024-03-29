import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/video_player.dart';
import 'package:foodspeciality/common%20files/video_player_file.dart';
import 'package:foodspeciality/login.dart';
import 'package:foodspeciality/screens/AddParticipantExistingCommunity.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatDetails.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/Follower.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/Following.dart';
import 'package:foodspeciality/screens/Inspiration_recipe_comment.dart';
import 'package:foodspeciality/screens/bottom_bar.dart';
import 'package:foodspeciality/screens/communityAddparticipants.dart';
import 'package:foodspeciality/screens/completed_challenge.dart';
import 'package:foodspeciality/screens/create_account.dart';
import 'package:foodspeciality/screens/discovery_recipe.dart';
import 'package:foodspeciality/screens/edit_profile.dart';
import 'package:foodspeciality/screens/followUser.dart';
import 'package:foodspeciality/screens/forgot_password.dart';
import 'package:foodspeciality/screens/join_challenge.dart';
import 'package:foodspeciality/screens/more_challenges.dart';
import 'package:foodspeciality/screens/more_joined_challenges.dart';
import 'package:foodspeciality/screens/more_my_challenges.dart';
import 'package:foodspeciality/screens/onboarding/onboarding.dart';
import 'package:foodspeciality/screens/otpScreen.dart';
import 'package:foodspeciality/screens/preview.dart';
import 'package:foodspeciality/screens/recipe_ingredients.dart';
import 'package:foodspeciality/screens/reset_password.dart';
import 'package:foodspeciality/screens/search_page.dart';
import 'package:foodspeciality/screens/setting/setting/accordion.dart';
import 'package:foodspeciality/screens/setting/setting/blocklist_full.dart';
import 'package:foodspeciality/screens/setting/setting/blog_news_article.dart';
import 'package:foodspeciality/screens/setting/setting/view_blog.dart';
// import 'packa+ge:foodspeciality/screens/setting/setting/setting.dart';
import 'package:foodspeciality/screens/signup_profile.dart';
import 'package:foodspeciality/screens/splash_screen2.dart';
import 'package:foodspeciality/screens/user_notification.dart';
import 'package:foodspeciality/screens/viewUser.dart';
import 'package:foodspeciality/sucessfully_blocked.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common files/video_player_network.dart';
import 'constants/app_constants.dart';
import 'constants/console_utils.dart';
import 'screens/InsideBottomBar/chats/Screens/ChatCommunityDetail.dart';
import 'screens/InsideBottomBar/chats/Screens/ViewCommumity.dart';
import 'screens/InsideBottomBar/chats/Screens/edit_community.dart';
import 'screens/completed_challenge_view.dart';
import 'screens/report.dart';
import 'screens/report_successfull.dart';
import 'screens/setting/setting/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FlutterBranchSdk.validateSDKIntegration();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // GlobalVariables globalVariables = GlobalVariables();
  accessToken = prefs.getString('accessToken');
  onboard = prefs.getBool("OnBoard");
  myUserId = prefs.getString('userId');
  myImage = prefs.getString('myImage');
  print("acs to ${accessToken}");
  await OneSignal.shared.setAppId("6c23e354-ecf2-4e7c-8473-aa3724e88a08");
  // final status = await OneSignal.shared.getDeviceState();
  // final String? playerId = status!.userId;
  // print("playerId $playerId");
  // playerIdGlobal = playerId;
  // Future.delayed(Duration(seconds: 0), () {
  //      listenDeepLinkData();
      
  //   });
  recipeIdFromDeepLink = await listenDeepLinkData();
  print("recipeIdFromDeepLink $recipeIdFromDeepLink");


  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

// Future<void> initPlatform() async{
//   // OneSignal.initialize("6c23e354-ecf2-4e7c-8473-aa3724e88a08");
//   // final playerId = await OneSignal.User.pushSubscription.id;
//   // print("playerId $playerId");
  
//   // OneSignalS\\


// }

//To Listen Generated Branch IO Link And Get Data From It
  Future<String?> listenDeepLinkData() async {
    print("listenDeepLinkData");
    streamSubscriptionDeepLink = FlutterBranchSdk.initSession().listen((data) {
      if (data.containsKey(AppConstants.clickedBranchLink) &&
          data[AppConstants.clickedBranchLink] == true) {
            print("ddsdfg " + data[AppConstants.deepLinkTitle]);
            recipeIdFromDeepLink = data[AppConstants.deepLinkTitle];
            print("ssd $recipeIdFromDeepLink");
            return data[AppConstants.deepLinkTitle];
            // final recipeId = await data[AppConstants.deepLinkTitle];
            // setState(() {
            //   recipeIdForRoute = data[AppConstants.deepLinkTitle];
            // });
            // Future.delayed(Duration(seconds: 5),(){
            //   print("inside delay");
            //   Get.toNamed("/InspirationRecipeComment",
            //     arguments: 
            //     // "c21e17da-2573-41d0-b2e0-f48ce1301b03"
            //     data[AppConstants.deepLinkTitle]
            //   );
            // });
            // Get.toNamed("/InspirationRecipeComment",
            //   arguments: 
            //   // "c21e17da-2573-41d0-b2e0-f48ce1301b03"
            //   data[AppConstants.deepLinkTitle]
            // );
            // print("ghgh");
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => NextScreen(
        //               customString: data[AppConstants.deepLinkTitle],
        //             )));
      }
    }, onError: (error) {
      PlatformException platformException = error as PlatformException;
      ConsoleLogUtils.printLog(
          '${platformException.code} - ${platformException.message}');
      // return "";
    });
  }

// checkToken(){
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//     GlobalVariables globalVariables = GlobalVariables();
//     globalVariables.accessToken = prefs.getString('accessToken');
//     print("acs to ${globalVariables.accessToken}");
//     // print("token " + jsonResp["data"]["accessToken"]);
//     // await prefs.setString('accessToken', jsonResp["data"]["accessToken"]);
//     // await prefs.setString('refreshToken', jsonResp["data"]["refreshToken"]);

//     runApp(new MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // GlobalVariables globalVariables = GlobalVariables();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 930),
      builder: (BuildContext context, Widget? child) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
          debugShowCheckedModeBanner: false,
          // home: LoginScreen(),  title: 'FreeU',
          // initialRoute: (accessToken == null || accessToken == "") ? '/' : '/bottomBar',
          initialRoute: onboard != true
              ? '/'
              : (accessToken == null || accessToken == "")
                  ? '/login'
                  : recipeIdFromDeepLink == null 
                    
                    ? '/bottomBar'
                    : 'InspirationRecipeComment',
          // Get.toNamed("/bottomBar")
          getPages: [
            //SplashScreen2()
            GetPage(name: '/', page: () => const SplashScreen2()),
            GetPage(name: "/onboard", page: () => const OnBoarding()),
            GetPage(name: "/login", page: () => const Login()),
            GetPage(name: "/forgetPass", page: () => ForgotPassword()),
            GetPage(
                name: "/otpverification", page: () => const otpVerification()),
            GetPage(name: "/createAcc", page: () => CreateAccountScreen()),
            GetPage(name: "/resetPass", page: () => ResetPassword()),
            GetPage(name: "/signUpProfile", page: () => const SignupProfile()),
            GetPage(
                name: "/discoveryRecipes",
                page: () => const DiscoveryRecipesScreen()),
            GetPage(name: "/viewuser", page: () => const viewUser()),
            // GetPage(name: "/followuser", page: () => const followUser()),
            GetPage(name: "/bottomBar", page: () => BottomBar()),
            GetPage(name: "/Preview", page: () => Preview()),

            GetPage(
                name: "/communityaddparticipants",
                page: () => const CommunityAddParticipants()),
            GetPage(
                name: "/addparticipantsexistingcommunity",
                page: () => const AddParticipantExistingCommunity()),
            GetPage(
                name: "/chatcommunitydetail",
                page: () => const ChatCommunityDetail()),
            GetPage(name: "/chatdetail", page: () => const ChatPrivateDetail()),
            // GetPage(name: "/myProfile", page: () => myProfile()),
            GetPage(
                name: "/networkplayerwidget",
                page: () => const NetworkPlayerWidget()),
            GetPage(name: "/setting", page: () => const Setting()),
            GetPage(name: "/joinchallenge", page: () => const JoinChallenge()),
            GetPage(
                name: "/notification", page: () => const UserNotifications()),
            GetPage(name: "/EditProfile", page: () => EditProfile()),
            GetPage(name: "/Report", page: () => const Report()),
            GetPage(name: "/ReportSuccess", page: () => const ReportSuccess()),
            GetPage(name: "/blocklistfull", page: () => const BlockListFull()),
            GetPage(
                name: "/sucessfullyblocked", page: () => SucessfullyBlocked()),
            GetPage(
                name: "/InspirationRecipeComment",
                page: () => const InspirationRecipeComment()),

            GetPage(name: "/SearchPage", page: () => const SearchPage()),
            GetPage(name: "/RecipeIng", page: () => const RecipeIng()),
            GetPage(name: "/FilePlayerWidget", page: () => FilePlayerWidget()),
            GetPage(name: "/ViewCommunity", page: () => const ViewCommunity()),
            GetPage(name: "/EditCommunity", page: () => const EditCommunity()),
            GetPage(name: "/following", page: () => const Following()),
            GetPage(name: "/follower", page: () => const Follower()),
            GetPage(name: "/faq", page: () => const Accordion()),
            GetPage(
                name: "/CompletedChallenge",
                page: () => const CompletedChallenge()),
            GetPage(name: "/assetplayerwidget", page: () => AssetPlayerWidget()),
            GetPage(name: "/MoreCompletedChallenges", page: () => MoreCompletedChallenges()),
            GetPage(name: "/MoreMyChallenges", page: () => MoreMyChallenges()),
            GetPage(name: "/MoreJoinedChallenges", page: () => MoreJoinedChallenges()),
            GetPage(name: "/CompletedChallengeView", page: () => CompletedChallengeView()),
            GetPage(name: "/BlogsNewsArticles", page: () => BlogsNewsArticles()),
            GetPage(name: "/ViewBlogs", page: () => ViewBlogs()),
            
          ],
        ),
      ),
    );
  }
}
