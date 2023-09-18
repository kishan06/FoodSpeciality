import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/comman_tabbar.dart';
import 'package:foodspeciality/common%20files/customSearchTextfield.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/myProfile/myFollowing/myFollowingCard.dart';
import 'package:foodspeciality/screens/Inspiration_recipe_comment.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';
import 'package:get/get.dart';

import '../common files/search_common_card.dart';
import '../controllers/recipe_ingre_controller.dart';
import '../controllers/search_page_controller.dart';
import 'common_chip.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool editChip = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final List<String> _textList = [];
  // final List _textList = []; 

  final TextEditingController _textController = TextEditingController();
  final TextEditingController tecSearch = TextEditingController();

  bool textFieldVisibile = false;
  bool _colorchange = true;
  RecipeIngreController recipeIngreController =
      Get.put(RecipeIngreController());
  List difficultyList = ["Easy", "Medium", "Hard"];
  var difficultyIndex = 4.obs;
  String? selectedDifficultyText;


  
  SearchPageController controllerSearch = Get.put(SearchPageController());

  // Future<void> share() async {
  //   await FlutterShare.share(
  //     title: 'Example share',
  //     text: 'Example share text',
  //     linkUrl: 'https://flutter.dev/',
  //     chooserTitle: 'Example Chooser Title'
  //   );
  // }

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controllerSearch.getDefaultSearchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            // extendBody: true,
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Column(
                  children: [
                    // searchNotification(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 17.h),
                      // padding: const EdgeInsets.all(8.0),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: SvgPicture.asset(
                              "assets/icons/back_arrow.svg",
                              height: 18.h,
                              width: 27.w,
                              color: AppColors.greyD3B3F43,
                            ),
                          ),
                          sizedBoxWidth(20.w),
                          Expanded(
                            child: CustomSearchTextFormField(
                              textEditingController: tecSearch,
                              autofocus: true,
                              hintText: "search recipes, ingredients or tips",
                              validatorText: "",
                              leadingIcon: Icon(
                                Icons.search,
                                size: 27.h,
                                color: AppColors.greyM707070,
                              ),
                              // on
                              
                              onChanged: (p0) {
                                setState(() {
                                  controllerSearch.getSearchRecipeData(
                                    tags: "", 
                                    difficulty: "",
                                    searchText: tecSearch.text
                                  );
                                });
                              },
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: 24.h, maxHeight: 24.h),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 17.w),
                                child: InkWell(
                                  onTap: () {
                                    filterBottomSheet();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/filter.svg",
                                    // height: 10.h,
                                    // width: 10.h,
                                    color: AppColors.greyD3B3F43,
                                    // colorFilter: AppColors.greyD3B3F43,
                                  ),
                                ),
                              ),
                              // pref
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommanTabbar("Recipes", "Community"),
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [tabbarView1(), tabbarView2()]),
                )
              ],
            )),
      ),
    );
  }

  Widget tabbarView1() {
    return SingleChildScrollView(
      child: GetBuilder<SearchPageController>(builder: (builder){
        return (tecSearch.text.isEmpty) 
          ? controllerSearch.isLoading 
            ? Center(child: CircularProgressIndicator())
            : controllerSearch.searchDefaultData == null 
            ? Center(child: textgrey18BoldSP("Something went wrong"))
            : Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(17.w, 15.h, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textBlack20SP_Med("Quick Searches"),

                      // textgreyM16Sp("South African Cuisine"),

                      sizedBoxHeight(15.h),

                      SizedBox(
                        height: 120.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 9.w);
                          },
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controllerSearch.searchDefaultData!.category.length,
                          itemBuilder: (context, index) {
                            final quickSearchData = controllerSearch.searchDefaultData!.category[index];
                            return GestureDetector(
                                onTap: () {
                                  // Get.to(InspirationRecipeComment());
                                },
                                child: commanCard(
                                  index,
                                  imageUrl: quickSearchData.coverImage,
                                  title: quickSearchData.category
                                ));
                          },
                        ),
                      ),

                      sizedBoxHeight(26.h),

                      // textgreyM16Sp("International Cuisine"),

                      // sizedBoxHeight(14.h),

                      // SizedBox(
                      //   height: 120.h,
                      //   child: ListView.separated(
                      //     separatorBuilder: (context, index) {
                      //       return SizedBox(width: 9.w);
                      //     },
                      //     scrollDirection: Axis.horizontal,
                      //     physics: const BouncingScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: 4,
                      //     itemBuilder: (context, index) {
                      //       return GestureDetector(
                      //           onTap: () {
                      //             Get.to(InspirationRecipeComment());
                      //           },
                      //           child: commanCard(index + 1));
                      //     },
                      //   ),
                      // ),

                      // sizedBoxHeight(24.h),

                      textBlack20SP_Med("Trending Tags"),

                      // commonSelectButton()
                      sizedBoxHeight(13.h),

                      SizedBox(
                        height: 30.h,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 9.w);
                          },
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controllerSearch.searchDefaultData!.tags.length,
                          itemBuilder: (context, index) {
                            return commonSelectButton(index, index + 1,
                              title: controllerSearch.searchDefaultData!.tags[index]
                            );
                          },
                        ),
                      ),

                      // sizedBoxHeight(8.h),

                      // SizedBox(
                      //   height: 30.h,
                      //   child: ListView.separated(
                      //     separatorBuilder: (context, index) {
                      //       return SizedBox(width: 9.w);
                      //     },
                      //     scrollDirection: Axis.horizontal,
                      //     physics: const BouncingScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: 6,
                      //     itemBuilder: (context, index) {
                      //       return commonSelectButton(index, index);
                      //     },
                      //   ),
                      // ),

                      sizedBoxHeight(20.h),

                      textBlack20SP_Med("Popular Searches"),

                      sizedBoxHeight(15.h),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),

                  // padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controllerSearch.searchDefaultData!.pularSearch.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.7,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.w,
                      //  maxCrossAxisExtent: 200,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final popularSearchData = controllerSearch.searchDefaultData!.pularSearch[index];
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              tecSearch.text = popularSearchData.name;
                              tecSearch.selection = TextSelection.collapsed(offset: tecSearch.text.length);
                              controllerSearch.getSearchRecipeData(
                                tags: "", 
                                difficulty: "",
                                searchText: tecSearch.text
                              );
                              // Get.to(InspirationRecipeComment());
                            },
                            child: Container(
                              // height: 120.h,
                              // width: 232.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.h),
                                  image: DecorationImage(
                                      image: NetworkImage(ApiUrls.base + popularSearchData.image),
                                      // index.isEven
                                      //     ? AssetImage("assets/home/food.png")
                                      //     : AssetImage("assets/Chocolate 2.png"),
                                      fit: BoxFit.fill)),

                              child: 
                              // Container(
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(12.h),
                              //       color: AppColors.greyL979797.withOpacity(0.7)),
                              //   child: Padding(
                              //     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       children: [
                              //         SvgPicture.asset(
                              //           "assets/bottomBar/food.svg",
                              //           height: 11.h,
                              //           width: 13.w,
                              //           color: AppColors.white,
                              //         ),
                              //         sizedBoxWidth(4.w),
                              //         // text
                              //         // textWhite12Sp(index.isEven ? "Limpopo" : "Mpumalanga")
                              //         textWhite12Sp(popularSearchData.name)
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.all(10.w),
                                  child: 
                                  // textWhite18Robo(index.isEven
                                  //     ? "Bobotie"
                                  //     : "Ethiopian Doro Wat"),
                                  Container(
                                    // color: AppColors.greyL979797.withOpacity(0.7),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      color: AppColors.greyL979797.withOpacity(0.7),

                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                      child: textWhite18Robo(popularSearchData.name),
                                    ))
                                ),
                              ),
                            ),
                          ),

                          // Positioned(
                          //   bottom: 10.h,
                          //   right: 10.h,
                          //   child: textWhite12Robo(
                          //     index.isEven ? "Bobotie" : "Ethiopian Doro Wat"
                          //   ),
                          // )
                        ],
                      );

                      // return Container(
                      //   // height: 14.h,
                      //   // width: 14.w,
                      //   decoration: BoxDecoration(

                      //       image: DecorationImage(
                      //           image: index.isEven
                      //               ? AssetImage("assets/home/17.png",

                      //               )
                      //               : AssetImage("assets/home/12.png"),
                      //           fit: BoxFit.cover
                      //           // Image.asset("name")
                      //           )),
                      // );
                      // // Image.asset("assets/home/17.png",
                      // //   height: 150.h,
                      //   width: 150.h,
                      // );
                    },
                  ),
               
                ),

                sizedBoxHeight(20.h)

              ],
            )
            : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: GetBuilder<SearchPageController>(builder: (builder){
                return controllerSearch.isLoadingSearchRecipe 
                ? Center(child: CircularProgressIndicator())
                : controllerSearch.searchRecipeData == null 
                ? Center(child: textgrey18BoldSP("Something went wrong"))
                : controllerSearch.searchRecipeData!.data.isEmpty 
                ? Center(child: textgrey18BoldSP("Nothing found"))
                : GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controllerSearch.searchRecipeData!.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 200/200,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.w,
                    //  maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final searchRecipe = controllerSearch.searchRecipeData!.data[index];
                    return OtherRecipeCard(
                      coverImage: searchRecipe.coverImage,
                      recipeName: searchRecipe.name,
                      userName: searchRecipe.user.username
                    );
                  },
                );
           
              })
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: controllerSearch.searchDefaultData!.pularSearch.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     childAspectRatio: 200/200,
              //     crossAxisSpacing: 10.w,
              //     mainAxisSpacing: 10.w,
              //     //  maxCrossAxisExtent: 200,
              //   ),
              //   itemBuilder: (BuildContext context, int index) {
              //     final popularSearchData = controllerSearch.searchDefaultData!.pularSearch[index];
              //     return OtherRecipeCard(
              //       coverImage: "public\\Breackfast\\Breakfast.jpg", 
              //       recipeName: "food", 
              //       userName: "raj"
              //     );
              //   },
              // ),
           
            );
          
      })
      
    );
  }

  Widget tabbarView2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          myFollowingCard(),
        ],
      ),
    );
  }

  Widget communityTile() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 16.w,
          ),
          Stack(
            children: [
              SizedBox(
                width: 50,
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.grey,
                  child: Image.asset(
                    "assets/Mask Group 86.png",
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0.h,
                  left: 35.w,
                  child: SvgPicture.asset(
                    "assets/rating-svgrepo-com.svg",
                    height: 22,
                  )),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed("/viewuser");
                },
                child: Text(
                  "Priyanka Joshi",
                  style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF54595F)),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "@priyujoshi",
                style: TextStyle(
                    fontFamily: "StudioProR",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(59, 63, 67, 0.49)),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFF3B3F43),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    "Follow",
                    style: TextStyle(
                      fontFamily: "StudioProR",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          )
        ],
      ),
    );
  }

  Widget commanCard(int index,{required String imageUrl, required String title}) {
    return InkWell(
      onTap: (){
        tecSearch.text = title;
        tecSearch.selection = TextSelection.collapsed(offset: tecSearch.text.length);
        controllerSearch.getSearchRecipeData(
          tags: "", 
          difficulty: "",
          searchText: tecSearch.text
        );
      },
      child: Stack(
        children: [
          Container(
            height: 120.h,
            width: 232.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.h),
                image: DecorationImage(
                    image: NetworkImage(ApiUrls.base + imageUrl),
                    // index.isEven
                    //     ? const AssetImage("assets/home/food.png")
                    //     : const AssetImage("assets/Chocolate 2.png"),
                    fit: BoxFit.fill)),
          ),
          Positioned(
            top: 8.h,
            left: 10.w,
            child: UnconstrainedBox(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.h),
                    color: AppColors.greyL979797.withOpacity(0.7)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/bottomBar/food.svg",
                        height: 11.h,
                        width: 13.w,
                        color: AppColors.white,
                      ),
                      sizedBoxWidth(4.w),
                      // text
                      // textWhite12Sp(index.isEven ? "Limpopo" : "Mpumalanga")
                      textWhite12Sp(title)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget commonSelectButton(int index, int add,{required String title}) {
    return InkWell(
      onTap: (){
        tecSearch.text = title;
        tecSearch.selection = TextSelection.collapsed(offset: tecSearch.text.length);
        controllerSearch.getSearchRecipeData(
          tags: "", 
          difficulty: "",
          searchText: tecSearch.text
        );
      },
      child: UnconstrainedBox(
        child: Container(
          height: 30.h,
          // width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.h),
              color: 
              // index == 0 ? AppColors.greyL979797 : 
              AppColors.greyM707070),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Center(
                // child: textWhite12Sp(add.isEven ? "Limpopo" : "Simple greens")
              child: textWhite12Sp(title),
            ),
          ),
        ),
      ),
    );
  }

  // Widget CommonChip(
  //     {required String text,
  //     bool colorchange = true,
  //     int? index,
  //     String? listName}) {
  //   // late bool _colorchange = true;

  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       SizedBox(
  //         height: 27.h,
  //         child: ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             elevation: 0,
  //             // ignore: deprecated_member_use
  //             primary: colorchange
  //                 ? const Color(0xFFE1E1E1)
  //                 : const Color.fromRGBO(84, 89, 95, 1),
  //             shape: RoundedRectangleBorder(
  //               side: colorchange
  //                   ? const BorderSide(
  //                       color: Color.fromARGB(255, 223, 216, 216))
  //                   : BorderSide.none,
  //               borderRadius: BorderRadius.circular(11.r),
  //             ),
  //           ),
  //           child: Row(
  //             children: [
  //               Visibility(
  //                   visible: !colorchange,
  //                   child: Row(
  //                     children: [
  //                       const Image(image: AssetImage("assets/style=bulk.png")),
  //                       SizedBox(
  //                         width: 7.42.w,
  //                       )
  //                     ],
  //                   )),
  //               Text(
  //                 text,
  //                 style: TextStyle(
  //                   color: colorchange ? const Color(0xFF303030) : Colors.white,
  //                   fontSize: 11.sp,
  //                   fontFamily: 'StudioProR',
  //                 ),
  //               ),
  //             ],
  //           ),
  //           onPressed: () {
  //             setState(() {
  //               print(colorchange);
  //               colorchange = !colorchange;

  //               print(colorchange);
  //               if (listName == "selectTags") {
  //                controllerSearch.selectTags[index!]["colorBool"] =
  //                     !controllerSearch.selectTags[index]["colorBool"];
  //               } else if (listName == "southAfricaCuisine") {
  //                 controllerSearch.southAfricaCuisine[index!]["colorBool"] =
  //                     !controllerSearch.southAfricaCuisine[index]["colorBool"];
  //               } else if (listName == "internationalCuisine") {
  //                 controllerSearch.internationalCuisine[index!]["colorBool"] =
  //                     !controllerSearch.internationalCuisine[index]["colorBool"];
  //               } else {
  //                 _textList[index!]["colorBool"] =
  //                     !_textList[index]["colorBool"];
  //               }
  //               if (colorchange) {
  //                 recipeIngreController.removeTags(text);
  //               } else {
  //                 recipeIngreController.addTags(text);
  //               }
  //               print(recipeIngreController.tags);
  //               // /
  //               // colorchange = _colorchange ? _colorchange = false : true;
  //             });
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  commomChipToggle(int index, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 27.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              // ignore: deprecated_member_use
              primary: difficultyIndex == index
                  ? const Color.fromRGBO(84, 89, 95, 1)
                  : const Color(0xFFE1E1E1),
              shape: RoundedRectangleBorder(
                side: difficultyIndex == index
                    ? BorderSide.none
                    : const BorderSide(
                        color: Color.fromARGB(255, 223, 216, 216)),
                borderRadius: BorderRadius.circular(11.r),
              ),
            ),
            child: Row(
              children: [
                Visibility(
                    visible: difficultyIndex == index,
                    child: Row(
                      children: [
                        const Image(image: AssetImage("assets/style=bulk.png")),
                        SizedBox(
                          width: 7.42.w,
                        )
                      ],
                    )),
                Text(
                  text,
                  style: TextStyle(
                    color: difficultyIndex == index
                        ? Colors.white
                        : const Color(0xFF303030),
                    fontSize: 11.sp,
                    fontFamily: 'StudioProR',
                  ),
                ),
              ],
            ),
            onPressed: () {
              difficultyIndex.value = index;
              selectedDifficultyText = text;
              // print(selectedDifficultyText);
              // setState(() {
              //   _colorchange = !_colorchange;
              //   // _colorchange = _colorchange ? _colorchange = false : true;
              // });
            },
          ),
        ),
      ],
    );
  }



  Future<T?> filterBottomSheet<T>() {
    return Get.bottomSheet(
        Container(
            // height: double.infinity - 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r))),
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 35.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13.w, right: 29.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'StudioProB',
                                  color: const Color(0xff3B3F43)),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.filter_list_sharp),
                              Text(
                                'Filters',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'StudioProM',
                                    color: const Color(0xff6B6B6B)),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                              controllerSearch.textList.clear();
                              filterBottomSheet();
                            },
                            child: Text(
                              'Clear All',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'StudioProB',
                                  color: const Color(0xff3B3F43)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxHeight(36.h),
                    Text(
                      'Add Tags',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'StudioProM',
                          color: const Color(0xff54595F)),
                    ),
                    sizedBoxHeight(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 11.w,
                          runSpacing: 7.h,
                          children: [
                            ...controllerSearch.textList
                                .map((text) => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CommonChip(text: text),
                                        Visibility(
                                          visible: editChip,
                                          child: Row(
                                            children: [
                                              sizedBoxWidth(3.w),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    controllerSearch.textList.remove(text);
                                                    // Get.back();
                                                    // filterBottomSheet();
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.cancel,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ))
                                .toList(),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        sizedBoxHeight(6.h),
                        Visibility(
                          visible: !textFieldVisibile,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    textFieldVisibile = true;
                                    Get.back();
                                    filterBottomSheet();
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    color: AppColors.buttonGrey54595F,
                                  ),
                                  height: 27.h,
                                  width: 70.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      sizedBoxWidth(6.w),
                                      SvgPicture.asset(
                                        "assets/svg/add-circle-svgrepo-com.svg",
                                        // height: 15.h,
                                        // width: 15.w,
                                      ),
                                      Text(
                                        "  Custom",
                                        style: TextStyle(
                                            color: const Color(0xffffffff),
                                            fontFamily: "Studio Pro",
                                            fontSize: 10.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      editChip = !editChip;
                                      Get.back();
                                      filterBottomSheet();
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: Icon(
                                      Icons.edit,
                                      color: editChip
                                          ? const Color(0xFFE1E1E1)
                                          : const Color.fromRGBO(84, 89, 95, 1),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Visibility(
                          visible: textFieldVisibile,
                          child: Form(
                            key: _formKey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      10.w,
                                  child: TextFormField(
                                    maxLength: 20,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Text';
                                      } else if (value.length < 2) {
                                        return 'Please enter atleast 2 characters';
                                      }
                                      return null;
                                    },
                                    autofocus: true,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                    decoration: InputDecoration(
                                      isCollapsed: true,
                                      suffixIconConstraints:
                                          const BoxConstraints(),
                                      contentPadding: EdgeInsets.all(17.h),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                          color: const Color(0xff54595f),
                                          fontSize: 10.sp,
                                          fontFamily: "Roboto"),
                                      hintText: 'Enter text here',
                                    ),
                                    cursorColor: const Color(0xFF3B3F43),
                                    onFieldSubmitted: (String value) {
                                      setState(() {
                                        final FormState? form =
                                            _formKey.currentState;

                                        if (form != null && form.validate()) {
                                          textFieldVisibile =
                                              !textFieldVisibile;
                                          _textController.clear();
                                          controllerSearch.textList.add(value);
                                          // Get.back();
                                          // filterBottomSheet();
                                        }
                                      });
                                    },
                                    controller: _textController,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xff54595f)),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          textFieldVisibile =
                                              !textFieldVisibile;
                                          // Get.back();
                                          // filterBottomSheet();
                                        });
                                      },
                                      child: const Text('Cancel')),
                                )
                              ],
                            ),
                          ),
                        ),
                        sizedBoxHeight(20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Select Tags",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight(13.h),
                        Wrap(
                          spacing: 11.w,
                          runSpacing: 7.h,
                          children: [
                            const CommonChip(text: "Savoury moments"),
                            const CommonChip(text: "Quarter to quick"),
                            const CommonChip(text: "Juicy Mondays"),
                            const CommonChip(text: "The healthy way"),
                            const CommonChip(text: "Fry-day!!"),
                            const CommonChip(text: "Simple greens"),
                            const CommonChip(text: "Flavour explosions"),
                            const CommonChip(text: "The healthy way"),
                            SizedBox(
                              height: 18.h,
                              width: double.infinity,
                            ),
                            Text(
                              "South Africa Cuisine",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                              width: double.infinity,
                            ),
                            const CommonChip(text: "Limpopo"),
                            const CommonChip(text: "Easy"),
                            const CommonChip(text: "Food"),
                            const CommonChip(text: "Carrot"),
                            const CommonChip(text: "Quick"),
                            const CommonChip(text: "Yoghurt"),
                            const CommonChip(text: "Breakfast"),
                            const CommonChip(text: "Quick"),
                            const CommonChip(text: "Yoghurt"),
                            SizedBox(
                              width: double.infinity,
                              height: 13.h,
                            ),
                            Text(
                              "International Cuisine",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                              width: double.infinity,
                            ),
                            const CommonChip(text: "Limpopo"),
                            const CommonChip(text: "Easy"),
                            const CommonChip(text: "Food"),
                            const CommonChip(text: "Carrot"),
                            const CommonChip(text: "Quick"),
                            const CommonChip(text: "Yoghurt"),
                            const CommonChip(text: "Breakfast"),
                            const CommonChip(text: "Quick"),
                            const CommonChip(text: "Yoghurt"),
                            SizedBox(
                              height: 13.h,
                              width: double.infinity,
                            ),
                            Text(
                              "Select Difficulty",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                              width: double.infinity,
                            ),
                            const CommonChip(text: "Easy"),
                            const CommonChip(text: "Medium"),
                            const CommonChip(text: "Hard"),
                          ],
                        ),
                        sizedBoxHeight(32.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 39.h,
                              width: 113.w,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff54595F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    side: BorderSide.none,
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  "Search",
                                  style: TextStyle(
                                    fontFamily: "StudioProR",
                                    fontSize: 16.sp,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxHeight(23.h)
                      ],
                    ),
                  ],
                ),
              ),
            )),
        isScrollControlled: true);
  }

}
