import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImageProvider {
  static Image asset({
    required String asset,
    Color? color,
    int? height,
    int? width,
  }) =>
      Image.asset(
        'assets/images/$asset.png',
        color: color,
        height: height?.h,
        width: width?.w,
      );

  static Image network(Color color, int height, int width,
      {required String url}) {
    return Image.asset(
      url,
      color: color,
      height: height.h,
      width: width.w,
    );
  }
}
