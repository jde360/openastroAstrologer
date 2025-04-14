import 'package:open_astro/model/chat_list_model.dart';
import 'package:open_astro/repository/chat/source/remote/remote.dart';

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
}
