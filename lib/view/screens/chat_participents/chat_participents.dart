import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_astro/controller/chat_list_controller.dart';
import 'package:open_astro/view/widgets/appbar.dart';

import '../../widgets/chat_tile_widget.dart';

class ChatParticipents extends StatelessWidget {
  ChatParticipents({super.key});

  final ChatListController _chatListController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Chat'),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: _chatListController.listOfChat.length,
            itemBuilder: (context, index) {
              final chat = _chatListController.listOfChat[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/chat');
                },
                child: ChatTileWidget(
                  imageUrl: chat.user?.profileImage ?? '',
                  isOnline: chat.chatOpen ?? false,
                  name: chat.user?.name ?? '',
                  subtitle: chat.lastMessage!,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
