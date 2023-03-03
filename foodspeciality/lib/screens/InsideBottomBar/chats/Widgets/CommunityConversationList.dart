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
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
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
                                fontSize: 18.sm,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            widget.member,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15.sm,
                                color: Color(0xFF54595F),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15.sm,
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
