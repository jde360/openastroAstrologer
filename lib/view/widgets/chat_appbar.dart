import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_astro/controller/user_controller.dart';

import '../../core/colors/color_pallet.dart';
import '../../core/font/app_font.dart';
import '../../service/image_provider.dart';
import '../../service/svg_provider.dart';

AppBar ChatAppBar({
  required String title,
  required UserController userController,
}) => AppBar(
  surfaceTintColor: AppColor().bg,
  actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
  leading: IconButton(
    onPressed: () {
      Get.back();
    },
    icon: SvgProvider.asset(asset: 'arrow_back'),
  ),
  title: Obx(() {
    log(userController.userProfileData.value.toString());
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child:
              userController.userProfileData.value.profileImage != null
                  ? userController
                          .userProfileData
                          .value
                          .profileImage!
                          .isNotEmpty
                      ? AppImageProvider.network(
                        45,
                        45,
                        url: userController.userProfileData.value.profileImage!,
                      )
                      : AppImageProvider.asset(
                        // fit: BoxFit.cover,
                        asset: 'user1',
                        height: 45,
                        width: 45,
                      )
                  : AppImageProvider.asset(
                    // fit: BoxFit.cover,
                    asset: 'user1',
                    height: 45,
                    width: 45,
                  ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userController.userProfileData.value.name ?? '',
                style: appText(size: 14, weight: FontWeight.w600),
              ),
              Text(
                // ? 'Offline'
                // :
                'Online',
                style: appText(
                  size: 12,
                  weight: FontWeight.w400,
                  color: AppColor().chatColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }),
  actions: [
    IconButton(
      onPressed: () {},
      icon: SvgProvider.asset(asset: 'phone', color: Colors.white),
    ),
    IconButton(
      onPressed: () {},
      icon: SvgProvider.asset(asset: 'video', color: Colors.white),
    ),
  ],
  centerTitle: false,
);
