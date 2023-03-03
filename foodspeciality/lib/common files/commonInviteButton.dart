// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonInviteButton extends StatefulWidget {
  var text;

  CommonInviteButton({
    Key? key,
    GlobalKey<FormState>? form,
    required this.text,
    // this.colorchange = false,
  }) : super(key: key);

  @override
  State<CommonInviteButton> createState() => _CommonInviteButtonState();
}

class _CommonInviteButtonState extends State<CommonInviteButton> {
  late bool _colorchange = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          // ignore: deprecated_member_use
          primary: _colorchange ? Color.fromRGBO(84, 89, 95, 1) : Colors.white,
          shape: RoundedRectangleBorder(
            side: _colorchange
                ? BorderSide.none
                : BorderSide(color: Color.fromARGB(84, 89, 95, 1)),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Row(
          children: [
            // Visibility(
            //     visible: !_colorchange,
            //     child: Row(
            //       children: [
            //         Text("Invited"),
            //         SizedBox(
            //           width: 7.42.w,
            //         )
            //       ],
            //     )),
            _colorchange
                ? Text(
                    widget.text,
                    style: TextStyle(
                      color: _colorchange ? Colors.white : Color(0xFF303030),
                      fontSize: 14.sm,
                      fontFamily: 'StudioProR',
                    ),
                  )
                : Row(
                    children: [
                      Text("Invited",
                          style: TextStyle(color: Color(0xFF303030))),
                    ],
                  ),
          ],
        ),
        onPressed: () {
          setState(() {
            _colorchange = !_colorchange;
            // _colorchange = _colorchange ? _colorchange = false : true;
          });
        },
      ),
    );
  }
}
