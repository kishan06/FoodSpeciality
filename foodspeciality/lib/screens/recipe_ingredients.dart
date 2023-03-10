import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/screens/ingredients_tabbarview.dart';
import 'package:foodspeciality/screens/preview.dart';
import 'package:foodspeciality/screens/recipe_tabbarview.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';

class RecipeIng extends StatefulWidget {
  const RecipeIng({super.key});

  @override
  State<RecipeIng> createState() => _RecipeIngState();
}

class _RecipeIngState extends State<RecipeIng>
    with SingleTickerProviderStateMixin {
  // bool? _visible = false;
  TabController? _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        switch (_tabController!.index) {
          case 0:
            _currentIndex = 0;
            break;
          case 1:
            _currentIndex = 1;
            break;
          default:
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromRGBO(59, 63, 67, 1),
          leading: const Icon(
            Icons.arrow_back,
          ),
          actions: [
            Visibility(
                visible: _currentIndex == 0 ? false : true,
                child: Row(
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const Preview());
                        },
                        child: Text(
                          "Preview",
                          style: TextStyle(
                              color: const Color(0xffABABAB),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Center(
                      child: Text(
                        "Publish",
                        style: TextStyle(
                            color: const Color(0xff000000),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(width: 16.w)
                  ],
                ))
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: TabBar(
              controller: _tabController,
              // onTap: (value) {
              //   if (value == 0) {
              //     setState(() {
              //       _visible = false;
              //     });
              //   } else {
              //     setState(() {
              //       _visible = true;
              //     });
              //   }
              //   ;
              // },
              indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2.5.sp),
                  insets: EdgeInsets.symmetric(horizontal: 100.w)),
              indicatorSize: TabBarIndicatorSize.label,
              // indicatorWeight: 4,

              indicatorColor: const Color(0xFF3B3F43),
              unselectedLabelStyle: const TextStyle(color: Color(0xFF6B6B6B)),
              labelColor: const Color.fromRGBO(59, 63, 67, 1),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
              tabs: [
                Tab(
                  child: Text(
                    "Recipe",
                    style: TextStyle(
                        fontFamily: "Studio Pro",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp),
                  ),
                ),
                Tab(
                  child: Text(
                    "Ingredients",
                    style: TextStyle(
                        fontFamily: "Studio Pro",
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
            controller: _tabController,
            children: [RecipeTabbarView(), IngredientsTabbatview()]),
      ),
    );
  }
}
