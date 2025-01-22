import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/core/font/app_font.dart';
import 'package:open_astro/service/svg_provider.dart';

AppBar customAppBar({required String title}) => AppBar(
      surfaceTintColor: AppColor().bg,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgProvider.asset(asset: 'arrow_back')),
      title: Text(
        title,
        style: appText(size: 22, weight: FontWeight.w400),
      ),
      centerTitle: false,
    );
