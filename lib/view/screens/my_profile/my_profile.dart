import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_astro/view/widgets/alertbox.dart';

import '../../../service/local_storage.dart';
import 'widgets/custom_tabs.dart';
import 'widgets/profile_widget.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [MyProfileWidget(), Expanded(child: CustomTabs())],
        ),
      ),
    );
  }
}
