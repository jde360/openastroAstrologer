import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgProvider {
  static SvgPicture network({required String url}) {
    return SvgPicture.network(url);
  }

  static SvgPicture asset({required String asset, Color? color}) {
    return SvgPicture.asset('assets/icons/$asset.svg', color: color);
  }
}
