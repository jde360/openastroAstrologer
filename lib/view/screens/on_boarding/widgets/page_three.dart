import 'package:flutter/material.dart';
import 'package:open_astro/core/font/app_font.dart';
import 'package:open_astro/service/image_provider.dart';
import 'package:open_astro/view/widgets/space.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImageProvider.asset(
              asset: 'page_two_image', height: 500, width: 500),
          space(
            height: 42,
            width: 0,
          ),
          Text(
            'OPENASTRO',
            style: appText(size: 29, weight: FontWeight.w400),
          ),
          space(
            height: 13,
            width: 0,
          ),
          Text(
            'Connect instantly with expert\n astrologers via chat, call, or video',
            style: appText(size: 20, weight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
