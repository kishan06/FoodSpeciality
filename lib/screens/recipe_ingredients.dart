// import 'dart:html';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodspeciality/constants/base_manager.dart';
import 'package:foodspeciality/controllers/recipe_ingre_controller.dart';
import 'package:foodspeciality/screens/InsideBottomBar/home/controller/home_controller.dart';
import 'package:foodspeciality/screens/preview.dart';
import 'package:foodspeciality/services/recipe_service.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../common files/sized_box.dart';
import 'common_chip.dart';
// import 'dropdownList.dart';
// import 'menuButton.dart';

// int currentIndex = 0;
enum SampleItem { itemOne, itemTwo, itemThree }

TabController? tabController;

class RecipeIng extends StatefulWidget {
  const RecipeIng({super.key});

  @override
  State<RecipeIng> createState() => _RecipeIngState();
}

class _RecipeIngState extends State<RecipeIng>
    with SingleTickerProviderStateMixin {
  // bool? _visible = false;
  // TabController? tabController;

  HomeController controllerHome = HomeController();
  // int currentIndex = 0;
  SampleItem? selectedMenu;

  RecipeIngreController recipeIngreController =
      Get.put(RecipeIngreController());
  final ImagePicker _picker = ImagePicker();
  final List<String> _textList = [];
  GlobalKey _popupMenuKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool editChip = false;
  bool textFieldVisibile = false;
  final TextEditingController _textController = TextEditingController();
  late int _selectedHour;
  late int _selectedMinute;
  int servigCount = 0;
  List<Widget> widgetsInColumn = [];
  final List<TextEditingController> _controllersTbs = [];
  int textControllerNumber = 0;
  final TextEditingController _tec = TextEditingController();
  final List<TextEditingController> _controllers = [];
  // final List<GlobalKey> popKeys = [];
  List<double> tbsint = [];
  final List<TextEditingController> _controllers2 = [];
  final List<TextEditingController> tecInstructionList = [];

  // int number = 2;
  File? _image;
  final TextEditingController _tbsController = TextEditingController(text: '1');
  List<Widget> stepsInColumn = [];
  final TextEditingController tecRecipeName = TextEditingController();
  final TextEditingController tecDescription = TextEditingController();
  var difficultyIndex = 4.obs;
  String? selectedDifficultyText;
  final List<String> items = [
    'cup',
    'fl oz',
    'oz',
    'tsp',
    'tbsp',
  ];
  String? selectedValue;
  final List<String?> dropdownData = [];

  List difficultyList = ["Easy", "Medium", "Hard"];
  // List<String> units = [];
  List ingredients = [];

  @override
  void initState() {
    super.initState();
    _controllers.add(TextEditingController());
    //_controllers2.add(TextEditingController());

    // super.initState();
    _selectedHour = 0;
    _selectedMinute = 0;
    // tabController = TabController(length: 2, vsync: this);

    // to add first ingredient
    _controllers.add(TextEditingController());
    _controllersTbs.add(TextEditingController());
    _controllers2.add(TextEditingController());
    _controllers2[textControllerNumber].text = "1";
    dropdownData.add("cup");
    textControllerNumber++;
    // widgetsInColumn.add(_recipeDetails(null, null, 0));

    // /

    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      setState(() {
        switch (tabController!.index) {
          case 0:
            // controllerHome.currentIndex = 0;
            controllerHome.changeTab(0);
            break;
          case 1:
            // currentIndex = 1;
            controllerHome.changeTab(1);

            break;
          default:
        }
      });
    });
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widgetsInColumn.isEmpty) {
      widgetsInColumn.add(_recipeDetails(null, null, 0));
    }
    // widgetsInColumn.add(_recipeDetails(null, null, 0));

    return DefaultTabController(
        length: 2,
        child: GetBuilder<HomeController>(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80.h,
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: const Color.fromRGBO(59, 63, 67, 1),
              // leading: InkWell(
              //   onTap: (){
              //     Get.back();
              //   },
              //   child: Image.asset("assets/icons/back_arrow.png",
              //     height: 20.h,
              //     width: 30.w,
              //     color: AppColors.greyD3B3F43,

              //     // color: ,
              //   )
              //   // const Icon(
              //   //   Icons.arrow_back,
              //   // ),
              // ),
              title: Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      "assets/icons/back_arrow.png",
                      height: 20.h,
                      width: 30.w,
                      color: AppColors.greyD3B3F43,
                      fit: BoxFit.contain,

                      // color: ,
                    )
                    // const Icon(
                    //   Icons.arrow_back,
                    // ),
                    ),
              ),
              actions: [
                Visibility(
                    visible: controllerHome.currentIndex == 0 ? false : true,
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
                          child: InkWell(
                            onTap: () async {
                              // RecipeService recipeService = RecipeService();
                              // recipeService.addRecipe(
                              //   videoPath: recipeIngreController.file!.path,
                              //   imagePath: recipeIngreController.image!.path
                              // );
                              int cookingTime =
                                  _selectedHour * 60 + _selectedMinute;
                              for (var i = 0; i < dropdownData.length; i++) {
                                ingredients.add({
                                  "name": _controllers[i].text,
                                  "quantity":
                                      _controllers2[i].text + dropdownData[i]!
                                });
                              }

                              callAddRecipeApi();

                              // if (res) {

                              // }

                              // RecipeService().addRecipe(
                              //   videoPath: videoPath,
                              //   imagePath: imagePath
                              // );
                              // showDialog(
                              //     context: context,
                              //     builder: (context) => PublishPopup());
                            },
                            child: Text(
                              "Publish",
                              style: TextStyle(
                                  color: const Color(0xff000000),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w)
                      ],
                    ))
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: TabBar(
                  controller: tabController,
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
                  unselectedLabelStyle:
                      const TextStyle(color: Color(0xFF6B6B6B)),
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
                controller: tabController,
                children: [recipeTab(), ingredientTab()]),
          );
        }));
  }

  callAddRecipeApi() async {
    RecipeService recipeService = RecipeService();
    int cookingTime = _selectedHour * 60 + _selectedMinute;

    var resp = await recipeService.addRecipe(
        // int cookingTime = _selectedHour * 60 + _selectedMinute,
        videoPath: recipeIngreController.file!.path,
        imagePath: recipeIngreController.image!.path,
        name: tecRecipeName.text,
        description: tecDescription.text,
        difficulty: selectedDifficultyText!,
        cookingTime: cookingTime.toString(),
        serving: servigCount.toString(),
        tags: recipeIngreController.tags.toString(),
        ingredients: ingredients.toString());

    if (resp.status == ResponseStatus.PRIVATE) {
      callAddRecipeApi();
    }
  }

  recipeTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight(22.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Upload A New Recipe",
                  style: TextStyle(
                      fontFamily: "Studio Pro",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(84, 89, 95, 1)),
                ),
              ],
            ),
            sizedBoxHeight(20.h),
            GetBuilder<RecipeIngreController>(builder: (context) {
              return recipeIngreController.file == null
                  ? SizedBox(
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          // ignore: deprecated_member_use
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xff707070)),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                "assets/svg/add-media-svgrepo-com.svg"),
                            SizedBox(
                              width: 7.42.w,
                            ),
                            Text(
                              "Upload Video",
                              style: TextStyle(
                                fontFamily: "Studio Pro",
                                fontWeight: FontWeight.w500,
                                fontSize: 18.spMin,
                                color: const Color(0xFF3E3D3D),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          // isVideo = true;
                          // _onImageButtonPressed(ImageSource.gallery);
                          builduploadprofile(true);

                          // _showPicker(context: context);
                        },
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                // ignore: deprecated_member_use
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0xff707070)),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    size: 25.h,
                                    color: const Color(0xFF3E3D3D),
                                  ),
                                  // SvgPicture.asset(
                                  //     "assets/svg/add-media-svgrepo-com.svg"),
                                  SizedBox(
                                    width: 7.42.w,
                                  ),
                                  Text(
                                    "Preview",
                                    style: TextStyle(
                                      fontFamily: "Studio Pro",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.spMin,
                                      color: const Color(0xFF3E3D3D),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                //Get.to(FilePlayerWidget(file: file));
                                Get.toNamed("/FilePlayerWidget",
                                    arguments: recipeIngreController.file);
                                // Get.to))
                                // isVideo = true;
                                // _onImageButtonPressed(ImageSource.gallery);
                                // builduploadprofile(true);

                                // _showPicker(context: context);
                              },
                            ),
                          ),
                        ),
                        sizedBoxWidth(10.w),
                        Expanded(
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                // ignore: deprecated_member_use
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0xff707070)),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    size: 22.h,
                                    color: const Color(0xFF3E3D3D),
                                  ),
                                  // SvgPicture.asset(
                                  //     "assets/svg/add-media-svgrepo-com.svg"),
                                  SizedBox(
                                    width: 7.42.w,
                                  ),
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                      fontFamily: "Studio Pro",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.spMin,
                                      color: const Color(0xFF3E3D3D),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                recipeIngreController.changeVideoFile(null);
                                // recipeIngreController.file = null;
                                // setState(() {});
                                // isVideo = true;
                                // _onImageButtonPressed(ImageSource.gallery);
                                // builduploadprofile(true);

                                // _showPicker(context: context);
                              },
                            ),
                          ),
                        ),
                      ],
                    );

              // return SizedBox();
            }),

            // Column(
            //     children: [
            //       Center(child: Text(galleryFile!.path)),
            //       SizedBox(
            //         height: 200,
            //         child: VideoPlayer(_videoPlayerController),
            //       ),
            //       // video should display here
            //     ],
            //   ),
            sizedBoxHeight(20.h),
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color.fromRGBO(242, 242, 242, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  side: BorderSide(color: const Color(0xFF979797), width: 1.w),
                ),
              ),
              child: InkWell(
                onTap: () {
                  builduploadprofile(false);
                },
                child: GetBuilder<RecipeIngreController>(builder: (context) {
                  return Container(
                    child: recipeIngreController.image != null
                        ? Image.file(
                            recipeIngreController.image!,
                            width: 150.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          )
                        : Column(
                            children: [
                              sizedBoxHeight(30.h),
                              SvgPicture.asset(
                                "assets/svg/upload-filled-svgrepo-com.svg",
                                height: 47.h,
                              ),
                              sizedBoxHeight(11.h),
                              Text(
                                "Add Cover Image",
                                style: TextStyle(
                                  fontFamily: "Studio Pro",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.spMin,
                                  color: const Color(0xFF3E3D3D),
                                ),
                              ),
                              sizedBoxHeight(7.h),
                              Text(
                                "Add a high quality and perfect image of \nyour food to inspire others.",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 12.spMin,
                                    color: const Color(0xFF979797)),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                  );
                }),
                // Container(
                //   child: recipeIngreController.image != null
                //       ? Image.file(
                //           recipeIngreController.image!,
                //           width: 150.w,
                //           height: 150.h,
                //           fit: BoxFit.cover,
                //         )
                //       : Column(
                //           children: [
                //             sizedBoxHeight(30.h),
                //             SvgPicture.asset(
                //               "assets/svg/upload-filled-svgrepo-com.svg",
                //               height: 47.h,
                //             ),
                //             sizedBoxHeight(11.h),
                //             Text(
                //               "Add Cover Image",
                //               style: TextStyle(
                //                 fontFamily: "Studio Pro",
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 18.spMin,
                //                 color: const Color(0xFF3E3D3D),
                //               ),
                //             ),
                //             sizedBoxHeight(7.h),
                //             Text(
                //               "Add a high quality and perfect image of \nyour food to inspire others.",
                //               style: TextStyle(
                //                   fontFamily: "Roboto",
                //                   fontSize: 12.spMin,
                //                   color: const Color(0xFF979797)),
                //               textAlign: TextAlign.center,
                //             )
                //           ],
                //         ),
                // ),
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Name Your Recipe",
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
            SizedBox(
              height: 50.h,
              child: TextFormField(
                controller: tecRecipeName,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  hintText: "Recipe's name",
                  hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color(0xff54595f),
                      fontSize: 17.h),
                ),
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Description",
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
            SizedBox(
              height: 112.h,
              child: TextFormField(
                controller: tecDescription,
                maxLines: 5,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  hintText: "Describe your recipe!",
                  hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color(0xff54595f),
                      fontSize: 17.h),
                ),
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Add Tags",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.spMin,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Add tags to make your post easy to find!",
                  style: TextStyle(fontFamily: "Roboto", fontSize: 14.sp),
                ),
              ],
            ),
            sizedBoxHeight(18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 11.w,
                  runSpacing: 7.h,
                  children: [
                    ..._textList
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
                                            _textList.remove(text);
                                            recipeIngreController
                                                .removeTags(text);
                                            print(recipeIngreController.tags);
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
                ),
              ],
            ),
            sizedBoxHeight(18.h),
            Visibility(
              visible: !textFieldVisibile,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        textFieldVisibile = true;
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
                        });
                      },
                      child: Icon(
                        Icons.edit,
                        color: editChip
                            ? const Color(0xFFE1E1E1)
                            : const Color.fromRGBO(84, 89, 95, 1),
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
                      width: MediaQuery.of(context).size.width / 2 - 10.w,
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
                          suffixIconConstraints: const BoxConstraints(),
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
                            final FormState? form = _formKey.currentState;
                            if (form != null && form.validate()) {
                              // form.save();
                              textFieldVisibile = !textFieldVisibile;
                              _textController.clear();
                              _textList.add(value);
                            }
                          });
                        },
                        controller: _textController,
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff54595f)),
                        ),
                        onPressed: () {
                          setState(() {
                            textFieldVisibile = !textFieldVisibile;
                          });
                        },
                        child: const Text('Cancel'))
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
                  height: 13.h,
                  width: double.infinity,
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
                SizedBox(
                  height: 6.h,
                ),
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
                    fontSize: 18.sp,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                  width: double.infinity,
                ),
                Obx(() => Wrap(
                      spacing: 11.w,
                      runSpacing: 7.h,
                      children: List.generate(
                          difficultyList.length,
                          (index) =>
                              commomChipToggle(index, difficultyList[index])),
                    ))
                // Wrap(
                //   spacing: 11.w,
                //   runSpacing: 7.h,
                //   children: List.generate(difficultyList.length, (index) => commomChipToggle(index, difficultyList[index])),
                // )
                // List.generate(difficultyList.length, (index) => commomChipToggle(index, "hg"))
                // const CommonChip(text: "Easy"),
                // const CommonChip(text: "Medium"),
                // const CommonChip(text: "Hard"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    tabController!.animateTo(1);
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: "Studio Pro",
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: const Color(0xFF3E3D3D),
                    ),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(10.h)
          ],
        ),
      ),
    );
  }

  ingredientTab() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight(22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Recipe Details",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(15.h),
            Container(
              height: 101.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xff707070)),
                    borderRadius: BorderRadius.circular(8.r)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // sizedBoxWidth(14.w),
                    SvgPicture.asset("assets/svg/Group 58248.svg"),
                    sizedBoxWidth(15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cooking Time",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Wrap(
                          children: [
                            Text(
                              "How long does it take \nto make this recipe?",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: const Color(0xff979797),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(_timeForServing());
                      },
                      child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side:
                                    const BorderSide(color: Color(0xff707070)),
                                borderRadius: BorderRadius.circular(8.r)),
                          ),
                          height: 45.h,
                          width: 116.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$_selectedHour Hr $_selectedMinute Min",
                                style: TextStyle(
                                    fontFamily: "Roboto", fontSize: 20.sp),
                              ),
                              sizedBoxWidth(1.w),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            sizedBoxHeight(15.h),
            Container(
              height: 101.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xff707070)),
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //  sizedBoxWidth(14.w),
                    SvgPicture.asset("assets/svg/Group 58247.svg"),
                    sizedBoxWidth(15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Servings",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "How many people does \nthis recipe serve?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: const Color(0xff979797),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(_servings());
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xff707070)),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        height: 45.h,
                        width: 116.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " $servigCount Serving",
                              style: const TextStyle(
                                  fontSize: 20, fontFamily: "Roboto"),
                            ),
                            sizedBoxWidth(1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Recipe Details",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.spMin,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(15.h),

            //_recipeDetails(_tec, _tbsController),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widgetsInColumn.length,
                itemBuilder: (BuildContext context, int index) {
                  return _recipeDetails(_tec, _tbsController, index);
                }),

            sizedBoxHeight(13.h),

            SizedBox(
              height: 40.h,
              width: 150.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  // ignore: deprecated_member_use
                  primary: const Color.fromRGBO(84, 89, 95, 1),
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                ),
                child: Text(
                  "+ Ingredient",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                onPressed: () async {
                  print(textControllerNumber);
                  // if (textControllerNumber < 5) {
                  // await textControllerNumber++;
                  _controllers.add(TextEditingController());
                  _controllersTbs.add(TextEditingController());
                  _controllers2.add(TextEditingController());
                  _controllers2[textControllerNumber].text = "1";
                  dropdownData.add("cup");
                  // popKeys.add(GlobalKey());
                  // units.add("");
                  textControllerNumber++;
                  print("bvg");

                  // if (_tec.text.isEmpty) {
                  //   return;
                  // } else {
                  //   setState(() {
                  //     widgetsInColumn.add(_recipeDetails(null));
                  //   });
                  // }
                  setState(() {
                    widgetsInColumn.add(_recipeDetails(null, null, 0));
                  });
                  // }
                },
              ),
            ),
            sizedBoxHeight(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Instructions",
                  style: TextStyle(
                    fontFamily: "Studio Pro",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.spMin,
                    color: const Color(0xFF3E3D3D),
                  ),
                ),
              ],
            ),
            sizedBoxHeight(20.h),

            // _instructionSteps(1),
            // Column(
            //   children: stepsInColumn,
            // ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: stepsInColumn.length,
                itemBuilder: (BuildContext context, int index) {
                  return _instructionSteps(index);
                }),

            sizedBoxHeight(14.h),
            SizedBox(
              height: 40.h,
              width: 150.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  // ignore: deprecated_member_use
                  primary: const Color.fromRGBO(84, 89, 95, 1),
                  shape: RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                ),
                child: Text(
                  "+ Instructions",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                onPressed: () {
                  // if (number < 5) {
                  setState(() {
                    tecInstructionList.add(TextEditingController());

                    stepsInColumn.add(_instructionSteps(0));
                    // number++;
                  });
                  // }
                },
              ),
            ),

            // ElevatedButton(onPressed: (){
            //   Get.to(PopupMenuExample());
            // }, child: Text("dropdown")),
            sizedBoxHeight(25)
          ],
        ),
      ),
    );
  }

  Widget _recipeDetails(TextEditingController? controller,
      TextEditingController? controllerTbs, int? index) {
    if (controllerTbs == null) {
      _controllersTbs[(textControllerNumber - 1)].text = "1";
    }
    // print("_recipeDetails $index");
    int _tbsInitialValue = 0;
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 45.h,
              width: 120.w,
              child: TextFormField(
                validator: (value) {
                  if (_tec.text.isEmpty) {
                    return 'Please enter Ingredient Name';
                  }
                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value!)) {
                    return 'Please enter a valid Ingredient Name';
                  }
                  return null;
                },
                controller: _controllers[index!],
                decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding: EdgeInsets.all(15.h),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF707070)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  hintText: "Ex. Salt",
                  hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color(0xff54595f),
                      fontSize: 17.h),
                ),
              ),
            ),
            // sizedBoxWidth(20.w),

            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_controllers2[index].text.isNotEmpty) {
                    if (double.tryParse(_controllers2[index].text)! > 0.1) {
                      _controllers2[index].text =
                          ((double.tryParse(_controllers2[index].text) ?? 0.1) -
                                  0.1)
                              .toStringAsFixed(2);
                    }
                  }
                });
              },
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: const Color(0xffE1E1E1),
                child: const Text(
                  "-",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),

            sizedBoxWidth(10.w),
            SizedBox(
              height: 45.h,
              width: 70.w,
              child: TextFormField(
                controller: _controllers2[index],

                // initialValue: '$_tbsInitialValue',
                keyboardType: TextInputType.number,
                // maxLength: 2,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  // WhitelistingTextInputFormatter(RegExp(r'^(\d+)?\.?\d{0,2}')),
                ],
                // onChanged: (value) {
                //   // _showPopupMenu();
                //   // openPopupMenu(index);
                //   if (units[index] == "") {
                //     openPopupMenu(index);
                //   }
                // },

                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.all(15.h),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF707070)),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    hintText: "Ex. 1 TBS",
                    hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        color: const Color(0xff54595f),
                        fontSize: 17.h),
                    counterText: ''),
              ),
            ),

            sizedBoxWidth(10.w),
            GestureDetector(
              onTap: () {
                setState(() {
                  _controllers2[index].text =
                      ((double.tryParse(_controllers2[index].text) ?? 0.1) +
                              0.1)
                          .toStringAsFixed(2);
                });
              },
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: const Color(0xffE1E1E1),
                child: const Text(
                  "+",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),

            Spacer(),
            SizedBox(
              width: 100.w,
              height: 45.h,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Unit',
                    style: TextStyle(
                      // fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: dropdownData[index],
                  onChanged: (value) {
                    setState(() {
                      dropdownData[index] = value!;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          // borderSide: const BorderSide(color: Color(0xff707070)),
                          border: Border.all(color: Color(0xFF707070)))),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
        sizedBoxHeight(13.h),
      ],
    );
  }

  // void openPopupMenu(int index) {
  //   final dynamic popupMenuState = popKeys[index].currentState;
  //   if (popupMenuState != null && popupMenuState.showButtonMenu != null) {
  //     popupMenuState.showButtonMenu();
  //   }
  // }

  // void _showPopupMenu() async {
  //   await showMenu(
  //     context: context,
  //     // position: RelativeRect.fromLTRB(100, 100, 100, 100),
  //     items: [
  //       PopupMenuItem(
  //         value: 1,
  //         child: Text("View"),
  //       ),
  //       PopupMenuItem(
  //           value: 2,
  //         child: Text("Edit"),
  //       ),
  //       PopupMenuItem(
  //         value: 3,
  //         child: Text("Delete"),
  //       ),
  //     ],
  //     elevation: 8.0,
  //   ).then((value){

  //   // NOTE: even you didnt select item this method will be called with null of value so you should call your call back with checking if value is not null , value is the value given in PopupMenuItem
  //   if(value!=null)
  //     print(value);
  //     });
  // }

  Widget _servings() {
    return BottomSheet(
      builder: (context) {
        return SizedBox(
          height: 200.0,
          child: CupertinoPicker(
            itemExtent: 32.0,
            onSelectedItemChanged: (int value) {
              setState(() {
                servigCount = value;
              });
            },
            children: List<Widget>.generate(100, (int index) {
              return Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontSize: 20, fontFamily: "Roboto"),
                ),
              );
            }),
          ),
        );
      },
      onClosing: () {
        Get.back();
      },
    );
  }

  Widget _timeForServing() {
    return BottomSheet(
      builder: (context) {
        return Column(
          children: [
            sizedBoxHeight(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Hours',
                  style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
                ),
                SizedBox(),
                Text(
                  "Minutes",
                  style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width / 2,
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        _selectedHour = index;
                      });
                    },
                    children: List<Widget>.generate(24, (int index) {
                      return Center(
                        child: Text(
                          '$index ',
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "Roboto"),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width / 2,
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        _selectedMinute = index;
                      });
                    },
                    children: List<Widget>.generate(60, (int index) {
                      return Center(
                        child: Text(
                          '$index ',
                          style: const TextStyle(
                              fontSize: 20, fontFamily: "Roboto"),
                        ),
                      );
                    }),
                  ),
                ),
                // Text('data')
              ],
            ),
          ],
        );
      },
      onClosing: () {
        Get.back();
      },
    );
  }

  builduploadprofileImage(int? index) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.camera);
                        Get.back();
                        print("dsf");
                        if (_image != null) {
                          Get.snackbar("title", "message");
                        }
                        // Get.snackbar(title, message)
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getImage(ImageSource.gallery);
                        Get.back();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 30,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  builduploadprofile(bool uploadVideo) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      builder: (context) {
        return Container(
          height: 100.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (uploadVideo) {
                          _onImageButtonPressed(ImageSource.camera);
                          Get.back();
                        } else {
                          getImage(ImageSource.camera);
                          Get.back();
                        }
                        // getImage(ImageSource.camera);
                        // Get.back();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 30.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (uploadVideo) {
                          _onImageButtonPressed(ImageSource.gallery);
                          Get.back();
                        } else {
                          getImage(ImageSource.gallery);
                          Get.back();
                        }
                        // getImage(ImageSource.gallery);
                        // Get.back();
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 30.sp,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(fontSize: 15.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    // if (_controller != null) {
    //   await _controller!.setVolume(0.0);
    // }
    // if (isVideo) {
    XFile? file = await _picker.pickVideo(
        source: source, maxDuration: const Duration(seconds: 10));
    recipeIngreController.changeVideoFile(file);
    // setState(() {});

    // await _playVideo(file);
    // Get.to(()=> FilePlayerWidget(file: file));
    // FilePlayerWidget(file: file);
    // }
  }

  Widget _instructionSteps(int? index) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              // index == null ? "Step 1" :
              'Step ' + (index! + 1).toString(),
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 17.sp,
                  color: const Color(0XFF6B6B6B)),
              // color: AppColors.),
            ),
          ],
        ),
        sizedBoxHeight(12.h),
        SizedBox(
          height: 68.h,
          child: TextFormField(
            controller: tecInstructionList[index],
            // maxLines: 2,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 8, left: 12),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff707070)),
                borderRadius: BorderRadius.circular(8.r),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF707070)),
                borderRadius: BorderRadius.circular(8.r),
              ),
              hintText: "Write your step of recipe here",
              hintStyle: TextStyle(
                  fontFamily: "Roboto",
                  color: const Color(0xff6B6B6B),
                  fontSize: 14.h),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  height: 50.h,
                  width: 40.w,
                  child: _image != null
                      ?
                      //  Image.asset("assets/camera.png")
                      Icon(Icons.check)
                      : GestureDetector(
                          onTap: () {
                            builduploadprofileImage(index);
                          },
                          child: Image.asset("assets/camera.png"),
                        ),
                ),
              ),
            ),
          ),
        ),
        sizedBoxHeight(15.h),
      ],
    );
  }

  Future getImage(
    ImageSource source,
  ) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      // final imagePermanent = await saveFilePermanently(image.path);

      // setState(() {
      //   // this._image
      //   recipeIngreController.image = imageTemporary;
      // });
      recipeIngreController.changeImageFile(imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    return File(imagePath).copy(imagePath);
  }

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
}
