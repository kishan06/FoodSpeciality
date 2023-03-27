import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:get/get.dart';

class IngredientsTabbatview extends StatefulWidget {
  const IngredientsTabbatview({super.key});

  @override
  State<IngredientsTabbatview> createState() => _IngredientsTabbatviewState();
}

class _IngredientsTabbatviewState extends State<IngredientsTabbatview> {
  List<Widget> widgetsInColumn = [];
  List<Widget> stepsInColumn = [];
  final List<TextEditingController> _controllers = [];
  int number = 2;
  int textControllerNumber = 0;
  final TextEditingController _tec = TextEditingController();
  int servigCount = 0;
  late int _selectedHour;
  late int _selectedMinute;
  final TextEditingController _tbsController = TextEditingController(text: '1');
  int _tbsInitialValue = 1;

  @override
  void initState() {
    _controllers.add(TextEditingController());
    super.initState();
    _selectedHour = 0;
    _selectedMinute = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sizedBoxWidth(14.w),
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
                    sizedBoxWidth(55.w),
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
              sizedBoxHeight(15.h),
              Container(
                height: 101.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sizedBoxWidth(14.w),
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
                    sizedBoxWidth(45.w),
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
              _recipeDetails(_tec),
              Column(
                children: widgetsInColumn,
              ),
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
                  onPressed: () {
                    if (textControllerNumber < 5) {
                      textControllerNumber++;
                      _controllers.add(TextEditingController());
                      // if (_tec.text.isEmpty) {
                      //   return;
                      // } else {
                      //   setState(() {
                      //     widgetsInColumn.add(_recipeDetails(null));
                      //   });
                      // }
                      setState(() {
                        widgetsInColumn.add(_recipeDetails(null));
                      });
                    }
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
              _instructionSteps(1),
              Column(
                children: stepsInColumn,
              ),
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
                    if (number < 5) {
                      setState(() {
                        stepsInColumn.add(_instructionSteps(null));
                        number++;
                      });
                    }
                  },
                ),
              ),
              sizedBoxHeight(25)
            ],
          ),
        ),
      ),
    );
  }

  Widget _recipeDetails(TextEditingController? controller) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 45.h,
              width: 155.w,
              child: TextFormField(
                validator: (value) {
                  if (_tec.text.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: controller == null
                    ? _controllers[textControllerNumber]
                    : _tec,
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
            sizedBoxWidth(33.w),
            GestureDetector(
              onTap: () {
                setState(() {
                  _tbsInitialValue == 1 ? null : _tbsInitialValue--;
                  _tbsController.text = '$_tbsInitialValue';
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
              width: 124.w,
              child: TextFormField(
                controller: _tbsController,
                // initialValue: '$_tbsInitialValue',
                keyboardType: TextInputType.number,
                maxLength: 2,
                textAlign: TextAlign.center,
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
                  _tbsInitialValue == 99 ? null : _tbsInitialValue++;
                  _tbsController.text = '$_tbsInitialValue';
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
            )
          ],
        ),
        sizedBoxHeight(13.h),
      ],
    );
  }

  Widget _instructionSteps(int? stepNum) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              stepNum == null ? "Step $number" : 'Step 1',
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
            maxLines: 2,
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
              suffixIcon: Image.asset("assets/camera.png"),
            ),
          ),
        ),
        sizedBoxHeight(15.h),
      ],
    );
  }

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
}
