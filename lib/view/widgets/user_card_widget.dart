import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_astro/service/image_provider.dart';

import '../../core/colors/color_pallet.dart';
import '../../core/font/app_font.dart';
import 'space.dart';

class UserCardWidget extends StatelessWidget {
  final String name;
  final String? image;
  final String id;
  const UserCardWidget({
    super.key,
    required this.name,
    required this.id,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    log("message ************************** ${image}");
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(10),
      // height: 200.h,
      width: 180.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor().primary.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48.w,
            backgroundColor: AppColor().primary.withValues(alpha: 0.2),
            // backgroundImage:

            //         ? NetworkImage(image!)
            //         : AssetImage('assets/images/user4.png'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child:
                  image!.isNotEmpty
                      ? AppImageProvider.network(100, 100, url: image!)
                      : AppImageProvider.asset(
                        asset: 'user4',
                        height: 100,
                        width: 100,
                      ),
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(100),
          //   child:
          //       image == null
          //           ? AppImageProvider.asset(
          //             // fit: BoxFit.cover,
          //             asset: 'user1',
          //             height: 45,
          //             width: 45,
          //           )
          //           : AppImageProvider.network(45, 45, url: image!),
          // ),
          space(height: 18, width: 0),
          Text(name, style: appText(size: 12, weight: FontWeight.w500)),
          space(height: 10, width: 0),
          GestureDetector(
            onTap: () {
              log(id);
              Get.toNamed('/chat', arguments: {'userId': id});
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColor().secondary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 5),
              child: Text(
                'Chat',
                style: appText(size: 13, weight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
