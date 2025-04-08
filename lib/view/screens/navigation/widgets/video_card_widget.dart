import 'package:flutter/material.dart';
import 'package:open_astro/service/svg_provider.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';

class VideoCardWidget extends StatelessWidget {
  final String id;
  final String thumbnail;
  const VideoCardWidget({super.key, required this.id, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: percentWidth(percent: 28),
      width: percentWidth(percent: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(thumbnail),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: SvgProvider.asset(asset: 'play'),
      ),
    );
  }
}
