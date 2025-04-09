import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_astro/service/local_storage.dart';
import 'package:open_astro/service/svg_provider.dart';

import '../../../../core/colors/color_pallet.dart';

class NavBarWidget extends StatelessWidget {
  NavBarWidget({super.key});
  final LocalStorage _localStorage = LocalStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: 60.h,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColor().textColor, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: SvgProvider.asset(asset: 'home')),
          IconButton(
            onPressed: () {
              Get.toNamed('/tips');
            },
            icon: SvgProvider.asset(asset: 'tips'),
          ),
          IconButton(
            onPressed: () {
              // _localStorage.removeToken();
              // _localStorage.setLatestFalse();
              // Get.offAllNamed('/');

              Get.toNamed('/my-profile');
            },
            icon: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor().primary.withValues(alpha: 0.2),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50),
                color: AppColor().primary,
                image: const DecorationImage(
                  image: AssetImage('assets/images/user1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/chat-partcipents');
            },
            icon: SvgProvider.asset(asset: 'chats'),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/followers');
            },
            icon: SvgProvider.asset(asset: 'followers'),
          ),
        ],
      ),
    );
  }
}
