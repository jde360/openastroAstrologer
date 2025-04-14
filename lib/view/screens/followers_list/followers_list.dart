import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/astrologer_profile_controller.dart';
import '../../../core/font/app_font.dart';
import '../../../service/image_provider.dart';

class FollowersListScreen extends StatelessWidget {
  FollowersListScreen({super.key});

  final AstrologerProfileController _astrologerProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Followers",
              style: appText(size: 22, weight: FontWeight.w400),
            ),
            Text(
              "40.5k Friends",
              style: appText(
                size: 14,
                weight: FontWeight.w600,
                color: Colors.white.withValues(alpha: 0.63),
              ),
            ),
          ],
        ),

        actions: [
          Obx(() {
            final profileImage =
                _astrologerProfileController
                    .astrologerProfileData
                    .value
                    .profileImage;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child:
                    profileImage == null || profileImage.isEmpty
                        ? AppImageProvider.asset(
                          asset: 'user1',
                          height: 41,
                          width: 41,
                        )
                        : AppImageProvider.network(41, 41, url: profileImage),
              ),
            );
          }),
        ],
      ),
      body: Obx(() {
        final followers = _astrologerProfileController.listOfFollowers;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: ListView.builder(
            itemCount: followers.length,
            itemBuilder: (context, index) {
              final follower = followers[index];
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: AppImageProvider.asset(
                      asset: 'user1',
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
                title: Text(
                  follower.user?.name ?? '',
                  style: appText(size: 14, weight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Kolkata, WB',
                  style: appText(size: 11, weight: FontWeight.w400),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
