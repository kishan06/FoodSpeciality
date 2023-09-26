import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/Model/MessageModel.dart';
import 'package:foodspeciality/constants/global.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPrivateDetail extends StatefulWidget {
  const ChatPrivateDetail({
    Key? key,
  }) : super(key: key);

  @override
  _ChatPrivateDetailState createState() => _ChatPrivateDetailState();
}

class _ChatPrivateDetailState extends State<ChatPrivateDetail> {
  final TextEditingController _messageController = TextEditingController();

  late IO.Socket socket;
  ScrollController myController = ScrollController();

  List<MessageModel> messages = [];

  @override
  void initState() {
    connect();
    super.initState();
  }

  void connect() {
    socket = IO.io("http://77.68.102.23:8000", {
      "transports": ["websocket"],
      'auth': {'x-auth-token': accessToken},
    });
    socket.connect();
    // socket.emit('message-personal', {
    //   'UserId': "9eefcbc3-b03e-4cfa-b6b6-791a1c24d888",
    //   'message': "hello world",
    // });
    socket.onConnect((_) {
      print('Connected: ${socket.id}');

      // Join the room
      socket.emit('join',
          {'room': '8c77d84f-4752-4841-9db2-6758b3a089f3', 'type': 'personal'});
      // socket.emit('join', {'room': 'YOUR_ROOM_NAME', 'type': 'community'});
    });

    socket.on('message', (data) {
      // Handle received message
      print('Received Message: $data');
      setMessage("receiver", data['message']);
    });

    socket.onConnectError((err) => print(err));

    // // Handle join room event
    // socket.on('join-personal', (data) {
    //   print('Join room event: $data');
    // });
  }

  @override
  void dispose() {
    socket.disconnect();
    _messageController.dispose();
    super.dispose();
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message);
    setState(() {
      messages.add(messageModel);
    });
  }

  void sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      // Emit a message event to the server
      Map<String, dynamic> messageMap = {
        'room': "c2dbd846-5eeb-49f6-bc45-b58d54fa4fc4",
        'message': message,
      };
      setMessage("source", message);
      socket.emit('message', messageMap);
      //   socket.emit('message', messageMap);
      print('Sent message: $messageMap'); // Print the sent message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 50),
        () => myController.jumpTo(myController.position.maxScrollExtent));
    return GestureDetector(
      onTap: () {
        Get.focusScope?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16.w),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  CircleAvatar(
                    backgroundImage: const AssetImage('assets/chef.png'),
                    maxRadius: 20.r,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Kriss Benwat",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ),
                  // ignore: prefer_const_constructors
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              controller: myController,
              itemCount: messages.length,
              padding: EdgeInsets.only(top: 10.h, bottom: 60.h),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return messages[index].type == "source"
                    ? Sender(message: messages[index].message)
                    : Receiver(message: messages[index].message);
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                        child: TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: "Send Message",
                            hintStyle: TextStyle(color: Colors.grey.shade600),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 14.h),
                              child: InkWell(
                                onTap: sendMessage,
                                child: Text(
                                  "Send",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(10.sp),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color(0xFF707070),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color(0xFF707070),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sender extends StatelessWidget {
  const Sender({
    super.key,
    this.message,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: Align(
        alignment: Alignment.topRight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  bottomLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
                color: const Color(0xFFE1E1E1),
              ),
              padding: EdgeInsets.all(16.sp),
              child: Text(
                message!,
                style: TextStyle(
                    fontFamily: "Roboto", fontSize: 15.sp, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Receiver extends StatelessWidget {
  const Receiver({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40.w,
              height: 40.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset('assets/chef.png'),
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                  color: const Color(0xFFF2F2F2)),
              padding: EdgeInsets.all(16.sp),
              child: Text(
                message!,
                style: TextStyle(fontFamily: "Roboto", fontSize: 15.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
