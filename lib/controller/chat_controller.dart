import 'dart:developer';

import 'package:get/get.dart';
import 'package:open_astro/model/chat_details_model.dart';
import 'package:open_astro/model/chat_list_model.dart';

import '../core/error/error.dart';
import '../core/error/error_handelar.dart';
import '../repository/chat/chat.dart';

class ChatController extends GetxController {
  final ChatRepository _chatRepository = ChatRepository();
  RxBool isLoading = true.obs;
  RxList<ChatList> listOfChat = <ChatList>[].obs;
  RxList<ChatDetailsModel> listOfChatDetails = <ChatDetailsModel>[].obs;

  // @override
  // void onInit() async {
  //   super.onInit();
  //   await getChatList();
  // }

  Future<void> getChatList() async {
    try {
      isLoading(true);

      List<ChatList> chatlist = await _chatRepository.getChatList();

      listOfChat.assignAll(chatlist);
      log('$listOfChat');
    } on AppError catch (e) {
      ErrorHandelar(err: e);
    } catch (e) {
      ErrorHandelar(err: AppError(code: 500, err: '$e'));
    } finally {
      isLoading(false);
    }
  }

  Future<void> getChatDetails({required String userId}) async {
    try {
      isLoading(true);

      List<ChatDetailsModel> chatDetails = await _chatRepository.getChatDetails(
        userId: userId,
      );

      listOfChatDetails.assignAll(chatDetails);
      log('$listOfChat');
    } on AppError catch (e) {
      ErrorHandelar(err: e);
    } catch (e) {
      ErrorHandelar(err: AppError(code: 500, err: '$e'));
    } finally {
      isLoading(false);
    }
  }
}
