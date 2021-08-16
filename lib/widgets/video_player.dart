import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NftVideoPlayer extends StatefulWidget {
  final String ? url;

 NftVideoPlayer({this.url});

  @override
  _NftVideoPlayerState createState() => _NftVideoPlayerState();
}

class _NftVideoPlayerState extends State<NftVideoPlayer> {
  late VideoPlayerController ? controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url!)
      ..initialize().then((_) {
        setState(() {
          controller!.play();
          controller!.setVolume(1);
          controller!.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: double.infinity,
      child: controller!.value.isInitialized
          ? GestureDetector(
        onTap: () {
          if (controller!.value.isPlaying) {
            controller!.pause();
          } else {
            controller!.play();
          }
        },
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child:VideoPlayer(
            controller!,

          ),

        ),
      )
          : Container(),
    );
  }


}
