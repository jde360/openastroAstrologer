import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_astro/data/video_data.dart';
import 'package:open_astro/model/video_model.dart';

import '../../../service/svg_provider.dart';
import 'widgets/controller.dart';
import 'widgets/video_player.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  final List<VideoModel> listOfTips = <VideoModel>[];
  @override
  void initState() {
    videoData.map((e) => listOfTips.add(VideoModel.fromJson(e))).toList();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: listOfTips.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                AppVideoPlayer(url: videoData[index]['sources'][0]),

                //back button
                Positioned(
                  top: 20,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: SvgProvider.asset(asset: 'arrow_back'),
                    ),
                  ),
                ),

                //controller
                Positioned(
                  right: 0,
                  bottom: 150.h,
                  child: const AppVideoController(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
