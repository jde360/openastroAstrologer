import '../../model/chat_details_model.dart';
import '../../model/chat_list_model.dart';
import 'source/remote/remote.dart';

import '../../core/error/error.dart';
import '../../core/network/http_client.dart';

class ChatRepository {
  final API _api = API();

  Future<List<ChatList>> getChatList() async {
    try {
      return await ChatRemoteDataSource(api: _api).getChatList();
    } on AppError {
      throw AppError;
    }
  }

  Future<List<ChatDetailsModel>> getChatDetails({
    required String userId,
  }) async {
    try {
      return await ChatRemoteDataSource(
        api: _api,
      ).getChatDetails(userId: userId);
    } on AppError {
      throw AppError;
    }
  }
}
