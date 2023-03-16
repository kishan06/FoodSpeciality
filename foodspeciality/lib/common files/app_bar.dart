// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  const CustomAppBar(
      {Key? key,
      required this.titleTxt,
      this.bottomtext,
      this.customProfileNavigation = false,
      this.navigateToTaxPlanning = false,
      this.showLeading = true})
      : super(key: key);

  final String titleTxt;
  final bool? bottomtext;
  final bool? customProfileNavigation;
  final bool? showLeading;
  final bool navigateToTaxPlanning;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        height: 50,
        decoration: const BoxDecoration(),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,

      titleSpacing: 0,
      // centerTitle: true,
      title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          titleTxt,
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
              //  fontFamily: 'Helvetica',
              fontSize: 20.sm,
              fontFamily: "StudioProR",
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(84, 89, 95, 1)),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
        ),
        iconSize: 22.sm,
        color: Color.fromRGBO(84, 89, 95, 1),
      ),
    );
  }
}
