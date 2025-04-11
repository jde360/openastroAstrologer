import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_astro/core/font/app_font.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';
import 'package:get/get.dart';

import '../../../../controller/astrologer_profile_controller.dart';
import '../../../../core/colors/color_pallet.dart';
import '../../../../service/image_provider.dart';

class MyProfileWidget extends StatelessWidget {
  MyProfileWidget({super.key});
  final AstrologerProfileController _astrologerProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    final profileImage =
        _astrologerProfileController.astrologerProfileData.value.profileImage;

    log('profileImage $profileImage');
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      //profile image
      leading: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child:
              profileImage == null || profileImage.isEmpty
                  ? AppImageProvider.asset(
                    asset: 'user1',
                    height: 53,
                    width: 53,
                  )
                  : AppImageProvider.network(53, 53, url: profileImage),
        ),
      ),
      //name
      title: Text(
        _astrologerProfileController.astrologerProfileData.value.realName ?? '',
        style: appText(size: 17, weight: FontWeight.w600),
      ),
      //specilizations
      subtitle: Text(
        '${_astrologerProfileController.astrologerProfileData.value.email ?? ''}  ',
        style: appText(size: 12, weight: FontWeight.w400),
      ),
      //follower & reels
      trailing: SizedBox(
        width: percentWidth(percent: 27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("100+", style: appText(size: 14, weight: FontWeight.w600)),
                Text("Tips", style: appText(size: 10, weight: FontWeight.w400)),
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/my-followers');
              },
              child: Column(
                children: [
                  Text(
                    "10k",
                    style: appText(size: 14, weight: FontWeight.w600),
                  ),
                  Text(
                    "Followers",
                    style: appText(size: 10, weight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
