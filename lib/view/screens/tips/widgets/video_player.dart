import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/colors/color_pallet.dart';

class AppVideoPlayer extends StatefulWidget {
  final String url;
  const AppVideoPlayer({super.key, required this.url});

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.url,
      ),
    )..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? InkWell(
              onTap: () {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
                setState(() {});
              },
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                // aspectRatio: _controller.value.aspectRatio,
                // aspectRatio: 9 / 16,
                child: Stack(
                  children: [
                    VideoPlayer(_controller),
                    _controller.value.isPlaying
                        ? const SizedBox()
                        : Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColor().bg.withOpacity(0.6),
                              child: Icon(
                                Icons.play_arrow,
                                size: 50,
                                color: AppColor().primary,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            )
          : const CircularProgressIndicator(),
    );
  }
}
