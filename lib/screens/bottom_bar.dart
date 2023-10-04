import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/buttons.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/new_chat_tab.dart';
import 'package:foodspeciality/screens/InsideBottomBar/explore/explore.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/home.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

import '../constants/app_constants.dart';
import '../constants/console_utils.dart';
import 'InsideBottomBar/myProfile/new_changed_profile.dart';

class BottomBar extends StatefulWidget {
  var selectedIndex;
  BottomBar({this.selectedIndex = 0});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

StreamSubscription<Map>? streamSubscriptionDeepLink;


class _BottomBarState extends State<BottomBar> {
  var _selectedIndex = 0.obs;
  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    const Explore(),
    Container(),
    const ChatTab(),
    // NewProfile(),
    const NewChangedProfile()
  ];
  bool _canPop = false;
  BranchContentMetaData metadata = BranchContentMetaData();
  BranchUniversalObject? buo;
  BranchLinkProperties lp = BranchLinkProperties();
  BranchEvent? eventStandard;
  BranchEvent? eventCustom;
  String? recipeIdForRoute;

  StreamSubscription<Map>? streamSubscription;
  StreamController<String> controllerData = StreamController<String>();
  StreamController<String> controllerInitSession = StreamController<String>();



  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 10), () {
    //   listenDeepLinkData(context);
      
    // });
    _selectedIndex.value = widget.selectedIndex;
    // listenDeepLinkData();
    print("in bottom $recipeIdForRoute");
    if (recipeIdForRoute != null) {
      Get.toNamed("/InspirationRecipeComment",
        arguments: recipeIdForRoute
      );
    }
    // listenDynamicLinks();s
    // initDeepLinkData();

  }

  @override
  void dispose() {
    super.dispose();
    streamSubscriptionDeepLink?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // if (recipeIdForRoute != null) {
    //   Get.toNamed("/InspirationRecipeComment",
    //     arguments: recipeIdForRoute
    //   );
    // }
    // Future.delayed(Duration.zero, () {
    //   listenDeepLinkData(context);
    // });
    return WillPopScope(
      onWillPop: () async {
        await dialoBox();
        return _canPop;
      },
      child: Scaffold(
          extendBody: true,
          body: SafeArea(
              bottom: false,
              child: Obx(() => _widgetOptions.elementAt(_selectedIndex.value))),
          bottomNavigationBar: Obx(
            () => Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    bottomBarCont(),
                    Container(
                      height: 80.h,
                      width: 20.w,
                      color: AppColors.white,
                    ),
                    bottomBarCont()
                  ],
                ),
                SizedBox(
                    child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: BottomNavigationBar(
                    selectedLabelStyle: const TextStyle(fontSize: 0),
                    unselectedLabelStyle: const TextStyle(fontSize: 0),
                    iconSize: 30.h,
                    selectedItemColor: AppColors.greyD3B3F43,
                    unselectedItemColor: AppColors.greyL979797,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    type: BottomNavigationBarType.fixed,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        activeIcon: activeIcon("assets/bottomBar/home.svg"),
                        icon: inactiveIcon("assets/bottomBar/home.svg"),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        activeIcon: activeIcon("assets/bottomBar/explore.svg"),
                        icon: inactiveIcon("assets/bottomBar/explore.svg"),
                        label: "",
                      ),
                      const BottomNavigationBarItem(
                        icon: Icon(Icons.circle, size: 0),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        activeIcon: activeIcon("assets/bottomBar/chat.svg"),
                        icon: inactiveIcon("assets/bottomBar/chat.svg"),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        activeIcon: activeIcon("assets/bottomBar/profile.svg"),
                        icon: inactiveIcon("assets/bottomBar/profile.svg"),
                        label: "",
                      ),
                    ],
                    currentIndex: _selectedIndex.value,
                    onTap: (int index) {
                      if (index != 2) {
                        _selectedIndex.value = index;
                      }
                    },
                  ),
                )),
                Positioned(
                  left: (MediaQuery.of(context).size.width / 2) - 32.5.h,
                  child: SizedBox(
                    height: 65.h,
                    width: 65.h,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.buttonGrey54595F,
                      onPressed: () {
                        Get.toNamed("/RecipeIng");
                      },
                      child: SvgPicture.asset(
                        "assets/bottomBar/food.svg",
                        height: 25.h,
                        width: 25.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

// comment

  //To Listen Generated Branch IO Link And Get Data From It
  // void listenDeepLinkData(BuildContext context) async {
  //   print("listenDeepLinkData");
  //   streamSubscriptionDeepLink = FlutterBranchSdk.initSession().listen((data) {
  //     if (data.containsKey(AppConstants.clickedBranchLink) &&
  //         data[AppConstants.clickedBranchLink] == true) {
  //           print("dds " + data[AppConstants.deepLinkTitle]);
  //           // return data[AppConstants.deepLinkTitle];
  //           // final recipeId = await data[AppConstants.deepLinkTitle];
  //           // setState(() {
  //           //   recipeIdForRoute = data[AppConstants.deepLinkTitle];
  //           // });
  //           // Future.delayed(Duration(seconds: 5),(){
  //           //   print("inside delay");
  //           //   Get.toNamed("/InspirationRecipeComment",
  //           //     arguments: 
  //           //     // "c21e17da-2573-41d0-b2e0-f48ce1301b03"
  //           //     data[AppConstants.deepLinkTitle]
  //           //   );
  //           // });
  //           Get.toNamed("/InspirationRecipeComment",
  //             arguments: 
  //             // "c21e17da-2573-41d0-b2e0-f48ce1301b03"
  //             data[AppConstants.deepLinkTitle]
  //           );
  //           print("ghgh");
  //       // Navigator.push(
  //       //     context,
  //       //     MaterialPageRoute(
  //       //         builder: (context) => NextScreen(
  //       //               customString: data[AppConstants.deepLinkTitle],
  //       //             )));
  //     }
  //   }, onError: (error) {
  //     PlatformException platformException = error as PlatformException;
  //     ConsoleLogUtils.printLog(
  //         '${platformException.code} - ${platformException.message}');
  //     // return "";
  //   });
  // }


// comment 

  // //To Listen Generated Branch IO Link And Get Data From It
  // void listenDeepLinkData(BuildContext context) async {
  //   streamSubscriptionDeepLink = FlutterBranchSdk.initSession().listen((data) {
  //     if (data.containsKey(AppConstants.clickedBranchLink) &&
  //         data[AppConstants.clickedBranchLink] == true) {
  //           print("getResul" + data["recipeId"]);

  //       // Navigator.push(
  //       //     context,
  //       //     MaterialPageRoute(
  //       //         builder: (context) => NextScreen(
  //       //               customString: data[AppConstants.deepLinkTitle],
  //       //             )));
  //     }
  //   }, onError: (error) {
  //     PlatformException platformException = error as PlatformException;
  //     ConsoleLogUtils.printLog(
  //         '${platformException.code} - ${platformException.message}');
  //   });
  // }

  // // To Listen Generated Branch IO Link And Get Data From It
  // void listenDeepLinkData() async {
  //   print("listenDeepLinkDat");
  //   print("gh");
  //   streamSubscriptionDeepLink = FlutterBranchSdk.initSession().listen((data) {
  //     if (data.containsKey(AppConstants.clickedBranchLink) &&
  //         data[AppConstants.clickedBranchLink] == true) {
            
  //           print("getResul" + data["recipeId"]);
  //           // Get.toNamed(page)
  //           Get.toNamed("/InspirationRecipeComment",
  //             arguments: data["recipeId"]
  //           );
  //           // print("getResult" + AppConstants.deepLinkTitle);
  //           // print("inIf");

  //       // Navigator.push(
  //       //     context,
  //       //     MaterialPageRoute(
  //       //         builder: (context) => NextScreen(
  //       //               customString: data[AppConstants.deepLinkTitle],
  //       //             )));
  //     }
  //   }, onError: (error) {
  //           print("inelse");

  //     PlatformException platformException = error as PlatformException;
  //     ConsoleLogUtils.printLog(
  //         '${platformException.code} - ${platformException.message}');
  //   });
  // }

  dialoBox() {
    return showDialog(
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.all(15.w),
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          insetPadding: const EdgeInsets.symmetric(vertical: 10),
          title: Text(
            "Exit App",
            style: TextStyle(
                fontFamily: 'Studio Pro',
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: const Color(0xff3B3F43)),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Are you sure you want to Exit App?",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  color: const Color(0xff54595F)),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                "No",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: const Color(0xff000000)),
              ),
            ),
            sizedBoxWidth(15.sp),
            InkWell(
              onTap: () {
                SystemNavigator.pop();
              },
              child: Text(
                "Yes",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: const Color(0xffB90101)),
              ),
            ),
            sizedBoxWidth(15.sp),
          ],
        ),
      ),
    );
  }

  Widget exitDialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(0),
      content: Stack(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.15),
                        BlendMode.srcOver,
                      ),
                      child: Image.asset(
                        "assets/hooray.png",
                      )),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 247.h,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          sizedBoxHeight(83.h),
                          Text(
                            "Exit App",
                            style: TextStyle(
                                color: const Color(0xff3B3F43),
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.bold,
                                fontSize: 26.sp),
                          ),
                          sizedBoxHeight(16.h),
                          Text(
                            "Are you sure you want to exit?",
                            style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: followButton("No", onPressed: () {
                                  Get.back();
                                }),
                              ),
                              SizedBox(
                                width: 100.w,
                                child: followButton("Yes", onPressed: () {
                                  _canPop = true;
                                  Get.back();
                                }),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 100,
                    child: Image.asset(
                      "assets/hooray_circle.png",
                      scale: 1.2,
                      fit: BoxFit.none,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomBarCont() {
    return Expanded(
        child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Container(
        height: 80.h,
        margin: EdgeInsets.only(top: 10.h), // ***
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.greyL979797,
              blurRadius: 5.h,
              spreadRadius: 2.h,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.h), topRight: Radius.circular(35.h)),
        ),
      ),
    ));
  }

  Widget activeIcon(String imagePath) {
    return Column(children: [
      SvgPicture.asset(
        imagePath,
        height: 35.h,
        width: 35.h,
        color: AppColors.greyD3B3F43,
        // colorFilter: AppColors.greyD3B3F43,
      ),
      sizedBoxHeight(5.h),
      CircleAvatar(
        radius: 5.h,
        backgroundColor: AppColors.greyD3B3F43,
      )
    ]);
  }

  Widget inactiveIcon(String imagePath) {
    return Column(children: [
      SvgPicture.asset(
        imagePath,
        height: 35.h,
        width: 35.h,
        color: AppColors.greyL979797,
      ),
      sizedBoxHeight(2.h),
      CircleAvatar(
        radius: 5.h,
        backgroundColor: Colors.transparent,
      )
    ]);
  }
}
