import 'package:flutter/material.dart';
import 'package:foodspeciality/common%20files/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class AssetPlayerWidget extends StatefulWidget {
  const AssetPlayerWidget({super.key});

  @override
  State<AssetPlayerWidget> createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  final asset = 'assets/video/video.mp4';
  late VideoPlayerController videoController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    videoController = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: videoController);
    // return VideoPlayerWidget();
    // return VideoPlayerWidget()
    // return const Placeholder();
  }
}