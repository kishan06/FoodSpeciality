import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chat.dart';
import 'package:foodspeciality/screens/InsideBottomBar/explore.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/home.dart';
import 'package:foodspeciality/screens/InsideBottomBar/profile.dart';
import 'package:foodspeciality/screens/recipe_ingredients.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

class NewStateless extends StatelessWidget {
  const NewStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomBar(),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var _selectedIndex = 0.obs;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const RecipeIng(),
    Container(),
    const Chat(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(() => _widgetOptions.elementAt(_selectedIndex.value)),
            bottomNavigationBar: Obx(
              () => SizedBox(
                  height: 80.h,
                  child: BottomNavigationBar(
                    // fixedColor: AppColors.transparent,
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
                        // icon: Icon(Icons.home),
                        label: "",
                      ),
                      BottomNavigationBarItem(
                        // icon: Icon(Icons.explore),
                        activeIcon: activeIcon("assets/bottomBar/explore.svg"),
                        icon: inactiveIcon("assets/bottomBar/explore.svg"),
                        label: "",
                      ),
                      BottomNavigationBarItem(
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
                  )),
            )));
  }

  Widget activeIcon(String imagePath) {
    return Column(children: [
      SvgPicture.asset(
        imagePath,
        height: 28.h,
        width: 28.h,
        color: AppColors.greyD3B3F43,
      ),
      sizedBoxHeight(2.h),
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
        height: 28.h,
        width: 28.h,
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
