import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonChip extends StatelessWidget {
  const CommonChip({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 27.h,
      child: Chip(
          backgroundColor: const Color(0xFFE1E1E1),
          label: Column(
            children: [
              Text(
                text,
                style: TextStyle(fontFamily: "Studio Pro", fontSize: 11.sp),
              ),
            ],
          )),
    );
  }
}
