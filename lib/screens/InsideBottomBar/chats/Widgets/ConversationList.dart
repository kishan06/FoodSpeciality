// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/common%20files/sized_box.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatDetails.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:foodspeciality/utils/texts.dart';

class ConversationList extends StatefulWidget {
  String name;

  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  int index;
  ConversationList(
      {Key? key,
      required this.name,
      required this.messageText,
      required this.imageUrl,
      required this.time,
      required this.index,
      required this.isMessageRead})
      : super(key: key);
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const ChatPrivateDetail();
          }),
        );
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 30.r,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15.sp,
                                color: Colors.grey.shade800,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                (widget.index == 0 || widget.index == 1)  ? CircleAvatar(
                  backgroundColor: AppColors.greyD3B3F43,
                  radius: 11.h,
                  child: Center(child: textWhite12Robo("2")),
                ): SizedBox(),

                sizedBoxHeight((widget.index == 0 || widget.index == 1) ? 5.h : 0),

                textgreyD10Robo(widget.time)
              ],
            )
          ],
        ),
      ),
    );
  }
}
