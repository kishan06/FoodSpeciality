// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/screens/InsideBottomBar/chats/Screens/ChatCommunityDetail.dart';

class CommunityConversationList extends StatefulWidget {
  String name;
  String messageText;
  String member;
  String imageUrl;

  bool isMessageRead;
  CommunityConversationList(
      {Key? key,
      required this.name,
      required this.messageText,
      required this.member,
      required this.imageUrl,
      required this.isMessageRead})
      : super(key: key);
  @override
  _CommunityConversationListState createState() =>
      _CommunityConversationListState();
}

class _CommunityConversationListState extends State<CommunityConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const ChatCommunityDetail();
          }),
        );
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
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
                            widget.member,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15.sp,
                                color: const Color(0xFF54595F),
                                fontWeight: FontWeight.w500),
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
          ],
        ),
      ),
    );
  }
}
