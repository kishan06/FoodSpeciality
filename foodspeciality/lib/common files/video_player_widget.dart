// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodspeciality/utils/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(
              alignment: Alignment.topCenter,
              child: buildVideo(),
            )
          : Container(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

  Widget buildVideo() => OrientationBuilder(builder: (context, orientation) {
        final isPortrait = orientation == Orientation.portrait;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.value.isPlaying
                    ? controller.pause()
                    : controller.play();
              },
              child: Stack(
                // fit: isPortrait ? StackFit.loose :StackFit.expand,
                children: [
                  buildVideoPlayer(),
                  Positioned.fill(child: buildPlay()),
                ],
              ),
            ),
            buildIndicator()
            // Positioned.fill(
            //   // bottom: 0,
            //   child: BasicOverLayWidget(controller: controller,)
            // )
          ],
        );
      });
  // Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     GestureDetector(
  //       onTap: (){
  //         controller.value.isPlaying
  //           ? controller.pause()
  //           : controller.play();
  //       },
  //       child: Stack(
  //         // fit: StackFit.expand,
  //         children: [
  //           buildVideoPlayer(),
  //           Positioned.fill(
  //             child: buildPlay()
  //           ),
  //         ],
  //       ),
  //     ),
  //     buildIndicator()
  //     // Positioned.fill(
  //     //   // bottom: 0,
  //     //   child: BasicOverLayWidget(controller: controller,)
  //     // )
  //   ],
  // );

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));

  Widget buildIndicator() =>
      VideoProgressIndicator(controller, allowScrubbing: true);

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          // height: double.infinity,
          // width: 200.w,
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(
            Icons.play_arrow,
            color: AppColors.white,
            size: 80.h,
          ),
        );
}
