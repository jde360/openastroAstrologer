import 'package:dio/dio.dart';
import 'package:open_astro/core/network/http_client.dart';

import '../../../../core/error/error.dart';
import '../../../../model/chat_list_model.dart';
import '../../../../service/local_storage.dart';

class ChatRemoteDataSource {
  final API api;
  ChatRemoteDataSource({required this.api});

  final LocalStorage _localStorage = LocalStorage();

  Future<List<ChatList>> getChatList() async {
    try {
      await _localStorage.init();
      final token = await _localStorage.getToken();
      api.dio.options.headers["Authorization"] = "Bearer $token";

      List<ChatList> chatlist = [];

      Response response = await api.dio.get("/chat/astrologer/participant");

      if (response.statusCode == 200 && response.data != null) {
        List<dynamic> result = response.data;
        for (var data in result) {
          chatlist.add(ChatList.fromJson(data));
        }
      }
      return chatlist;
    } on DioException catch (e) {
      throw AppError(
        code: e.response?.statusCode ?? 400,
        err:
            e.response?.data['error'] ??
            e.response?.statusMessage ??
            'Unknown Error',
      );
    }
  }
}
