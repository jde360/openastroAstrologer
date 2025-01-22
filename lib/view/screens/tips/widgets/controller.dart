import 'package:flutter/material.dart';
import 'package:open_astro/core/font/app_font.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../service/svg_provider.dart';

class AppVideoController extends StatelessWidget {
  const AppVideoController({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgProvider.asset(asset: 'like'),
              ),
              Text(
                '13K',
                style: appText(size: 18, weight: FontWeight.w600),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgProvider.asset(asset: 'comment'),
              ),
              Text(
                '1.3K',
                style: appText(size: 18, weight: FontWeight.w600),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
            onPressed: () async {
              await Share.share('check out my website https://example.com');
            },
            icon: SvgProvider.asset(asset: 'share'),
          ),
        )
      ],
    );
  }
}
