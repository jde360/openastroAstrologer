import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_astro/core/font/app_font.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../controller/astrologer_profile_controller.dart';
import '../../../controller/chat_controller.dart';
import '../../../controller/user_controller.dart';
import '../../widgets/space.dart';
import '../../widgets/user_card_widget.dart';
import '../../widgets/chat_tile_widget.dart';
import 'widgets/nav_bar_widget.dart';
import 'widgets/status_switch_button.dart';
import 'widgets/video_card_widget.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final AstrologerProfileController _astrologerProfileController = Get.find();
  final ChatController _chatController = Get.find();

  final UserController _userController = Get.find();

  List<String> switchList = ['phone', 'video', 'message'];
  // final String thumbnail =
  //     'https://s3-alpha-sig.figma.com/img/b283/5891/58f870bf0940aff3e099b3032c91587d?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JiuoeaI22vXTc0nslszquZERj00Jc5zQuoVEeimOzFyqDEOhUI31~fdl9FZgQJSkrsnXOPd9Ign0Htmdkjq4odIDZSHrNEm9v9cGH2pcjJ72mP9LLh24o9e6rttIeZvXBBvNijQzW-su-eYpJjbAECc4Be-LSEmBn6dHtbqgargaYfr~uLWO~z0eMY5QD69Pgdr04bopNS-biJjdPBAr4dnjvvPK9LqQdUnwH5QFAmL1R8u3j6pPMSeXGSkCAFH~6VyCyHyRfVFSK4fwrnE-UThp5C6uB-kda7iyGheCDoyOEU-LAfslYPD3O-U0unq-HIDOcUvhvTMh2-NH7MWIYg__';

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _userController.getUserList();
      await _chatController.getChatList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  space(height: 12, width: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () =>
                            _astrologerProfileController.isLoading.isTrue
                                ? Skeletonizer(
                                  containersColor: Colors.white12,
                                  enabled: true,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 55,
                                    width: 120,
                                  ),
                                )
                                : StatusSwitchButton(
                                  iconName: 'phone',
                                  onTap: () {
                                    _changeStatus('phone');
                                  },
                                  status:
                                      _astrologerProfileController
                                          .astrologerProfileData
                                          .value
                                          .astroProfile!
                                          .callActive ??
                                      false,
                                ),
                      ),
                      Obx(
                        () =>
                            _astrologerProfileController.isLoading.isTrue
                                ? Skeletonizer(
                                  containersColor: Colors.white12,
                                  enabled: true,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 55,
                                    width: 120,
                                  ),
                                )
                                : StatusSwitchButton(
                                  iconName: 'video',
                                  onTap: () {
                                    _changeStatus('video');
                                  },
                                  status:
                                      _astrologerProfileController
                                          .astrologerProfileData
                                          .value
                                          .astroProfile!
                                          .videoCallActive ??
                                      false,
                                ),
                      ),
                      Obx(
                        () =>
                            _astrologerProfileController.isLoading.isTrue
                                ? Skeletonizer(
                                  containersColor: Colors.white12,
                                  enabled: true,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    height: 55,
                                    width: 120,
                                  ),
                                )
                                : StatusSwitchButton(
                                  iconName: 'message',
                                  onTap: () {
                                    _changeStatus('message');
                                  },
                                  status:
                                      _astrologerProfileController
                                          .astrologerProfileData
                                          .value
                                          .astroProfile!
                                          .chatActive ??
                                      false,
                                ),
                      ),
                    ],
                  ),
                  space(height: 15, width: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Activity',
                        style: appText(size: 14, weight: FontWeight.w400),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  Obx(() {
                    return SizedBox(
                      width: double.infinity,
                      height: percentHeight(percent: 15),
                      child: ListView.builder(
                        itemCount:
                            _chatController.listOfChat.length > 5
                                ? 5
                                : _chatController.listOfChat.length,
                        itemBuilder: (context, index) {
                          final chat = _chatController.listOfChat[index];
                          return GestureDetector(
                            onTap: () {
                              // Get.toNamed('/chat');
                            },
                            child: ChatTileWidget(
                              imageUrl: chat.user?.profileImage ?? '',
                              isOnline: chat.chatOpen ?? false,
                              name: chat.user?.name ?? '',
                              subtitle: chat.lastMessage!,
                              unreadCount: chat?.unreadCount ?? 0,
                            ),
                          );
                        },
                      ),
                    );
                  }),

                  space(height: 0, width: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Activity',
                        style: appText(size: 14, weight: FontWeight.w400),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        // VideoCardWidget(id: '1', thumbnail: thumbnail),
                        // VideoCardWidget(id: '1', thumbnail: thumbnail),
                        // VideoCardWidget(id: '1', thumbnail: thumbnail),
                        // VideoCardWidget(id: '1', thumbnail: thumbnail),
                        // VideoCardWidget(id: '1', thumbnail: thumbnail),
                        // VideoCardWidget(id: '1', thumbnail: thumbnail),
                        // VideoCardWidget(id: '1', thumbnail: thumbnail),
                        // VideoCardWidget(id: '1', thumbnail: thumbnail),
                        // VideoCardWidget(id: '1', thumbnail: thumbnail),
                      ],
                    ),
                  ),
                  space(height: 15, width: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Users',
                        style: appText(size: 14, weight: FontWeight.w400),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  space(height: 15, width: 0),
                  SizedBox(
                    width: double.infinity,
                    height: 220.h,
                    child: ListView.builder(
                      itemCount: _userController.listOfUser.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final user = _userController.listOfUser[index];
                        return UserCardWidget(
                          name: user.name ?? '',
                          image: user.profileImage,
                          id: user.sId!,
                        );
                      },
                    ),
                  ),
                  space(height: 15, width: 0),
                ],
              ),
            ),
          );
        }),
        bottomNavigationBar: NavBarWidget(),
      ),
    );
  }

  void _changeStatus(String status) async {
    if (status == 'message') {
      await _astrologerProfileController.updateChatStatus(
        status:
            !_astrologerProfileController
                .astrologerProfileData
                .value
                .astroProfile!
                .chatActive!,
      );
    } else if (status == 'phone') {
      await _astrologerProfileController.updateAudioStatus(
        status:
            !_astrologerProfileController
                .astrologerProfileData
                .value
                .astroProfile!
                .callActive!,
      );
    } else if (status == 'video') {
      await _astrologerProfileController.updateVideoStatus(
        status:
            !_astrologerProfileController
                .astrologerProfileData
                .value
                .astroProfile!
                .videoCallActive!,
      );
    }
    await _astrologerProfileController.getAstrologerProfile();
  }
}
