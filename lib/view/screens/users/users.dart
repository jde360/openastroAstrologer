import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_astro/view/widgets/appbar.dart';

import '../../../controller/user_controller.dart';
import '../../widgets/user_card_widget.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final UserController _userController = Get.find();
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _userController.getUserList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Users'),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: [
                  ..._userController.listOfUser.map((e) {
                    return UserCardWidget(
                      name: e.name ?? '',
                      image: e.profileImage,
                      id: e.sId!,
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
