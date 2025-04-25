import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_astro/controller/astrologer_profile_controller.dart';
import 'package:open_astro/controller/chat_controller.dart';
import 'package:open_astro/controller/user_controller.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';
import 'package:open_astro/view/widgets/chat_appbar.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../core/font/app_font.dart';
import '../../../model/chat_details_model.dart';
import '../../../service/socket_service.dart';
import '../../../service/svg_provider.dart';
import 'widgets/chatContainer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  IO.Socket socketIo = SocketIOClient().appSocket;

  TextEditingController sendMessageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String userId = '';
  final ChatController _chatController = Get.find();
  final UserController _userController = Get.find();
  final AstrologerProfileController _astrologerProfileController = Get.find();
  String currentTime = DateTime.now().toIso8601String();

  @override
  void initState() {
    userId = Get.arguments['userId'];
    log(userId.toString());
    socketIo.off('newMessage');
    socketIo.on('newMessage', (data) {
      log('data $data');
      _chatController.listOfChatDetails.add(
        ChatDetailsModel(
          message: data['message'],
          senderType: data['senderType'],
          receiver: data['receiver'],
          sender: data['sender'],
          createdAt: currentTime,
        ),
      );
    });
    Future.delayed(Duration.zero, () async {
      await _chatController.getChatDetails(userId: userId);
      await _userController.getUserProfile(id: userId);
      _scrollToBottom();
    });

    super.initState();
  }

  void sendMessage(String message) async {
    try {
      socketIo.emit('astrologerSendMessage', {
        'message': message,
        'userId': userId,
        'astrologerId':
            _astrologerProfileController.astrologerProfileData.value.sId,
      });
      _chatController.listOfChatDetails.add(
        ChatDetailsModel(
          message: message,
          senderType: 'astrologer',
          receiver: userId,
          sender: _astrologerProfileController.astrologerProfileData.value.sId,
        ),
      );
      log(
        'data $message, $userId , ${_astrologerProfileController.astrologerProfileData.value.sId}',
      );
      _scrollToBottom();
    } catch (e) {
      log('$e');
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(title: 'chat', userController: _userController),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return Column(
                children: [
                  _chatController.listOfChatDetails.isEmpty
                      ? Container()
                      : Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: _chatController.listOfChatDetails.length,
                          itemBuilder: (context, index) {
                            final chat =
                                _chatController.listOfChatDetails[index];
                            return ChatContainer(
                              isSender: chat.senderType == 'astrologer',
                              message: chat.message!,
                              time: chat.createdAt ?? currentTime,
                            );
                          },
                        ),
                      ),
                ],
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.white54),
              ),
              height: 60,
              width: percentWidth(),
              child: Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: percentWidth(percent: 80),
                    child: TextField(
                      controller: sendMessageController,
                      decoration: InputDecoration(
                        hintText: 'Type here...',
                        hintStyle: appText(
                          size: 15,
                          weight: FontWeight.w400,
                          color: Colors.white54,
                        ),
                        contentPadding: EdgeInsets.all(8),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (sendMessageController.value.text.isNotEmpty) {
                        sendMessage(sendMessageController.value.text);
                      } else {
                        log(
                          'message not found ${sendMessageController.value.text.isEmpty}',
                        );
                      }
                    },
                    icon: SvgProvider.asset(asset: 'send'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
