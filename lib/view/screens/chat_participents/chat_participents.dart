import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_astro/controller/chat_controller.dart';
import 'package:open_astro/view/widgets/appbar.dart';

import '../../widgets/chat_tile_widget.dart';

class ChatParticipents extends StatefulWidget {
  ChatParticipents({super.key});

  @override
  State<ChatParticipents> createState() => _ChatParticipentsState();
}

class _ChatParticipentsState extends State<ChatParticipents> {
  final ChatController _chatController = Get.find();
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _chatController.getChatList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Chat'),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: _chatController.listOfChat.length,
            itemBuilder: (context, index) {
              final chat = _chatController.listOfChat[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed('/chat', arguments: {'userId': chat.user?.sId});
                },
                child: ChatTileWidget(
                  imageUrl: chat.user?.profileImage ?? '',
                  isOnline: chat.chatOpen ?? false,
                  name: chat.user?.name ?? '',
                  subtitle: chat.lastMessage!,
                  unreadCount: chat.unreadCount ?? 0,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
