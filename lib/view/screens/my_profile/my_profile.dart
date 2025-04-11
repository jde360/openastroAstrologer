import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_astro/view/widgets/log_out_alertbox.dart';

import '../../../controller/astrologer_profile_controller.dart';
import '../../../core/colors/color_pallet.dart';
import '../../../service/local_storage.dart';
import 'widgets/custom_tabs.dart';
import 'widgets/profile_widget.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final AstrologerProfileController _astrologerProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("My Profile"),
        actions: [
          IconButton(
            onPressed: () {
              logoutAlertBox(context);
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      // body: CustomTabs(),
      body: Obx(() {
        return _astrologerProfileController.isLoading.value
            ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: AppColor().bg,
                strokeWidth: 2,
              ),
            )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [MyProfileWidget(), Expanded(child: CustomTabs())],
              ),
            );
      }),
    );
  }
}
