import 'package:dio/dio.dart';

import '../../../../core/error/error.dart';
import '../../../../model/user_list_model.dart';

import '../../../../core/network/http_client.dart';
import '../../../../service/local_storage.dart';

class UserRemoteDataSource {
  final API api;
  UserRemoteDataSource({required this.api});
  // final LocalStorage _localStorage = LocalStorage();

  Future<List<UserListModel>> getUserList() async {
    try {
      // await _localStorage.init();
      // final token = await _localStorage.getToken();
      // api.dio.options.headers["Authorization"] = "Bearer $token";

      List<UserListModel> userList = [];

      Response response = await api.dio.get(
        "/account/list/user?limit=null&offset=null",
      );

      if (response.statusCode == 200 && response.data['result'] != null) {
        List<dynamic> result = response.data['result'];
        for (var data in result) {
          userList.add(UserListModel.fromJson(data));
        }
      }
      return userList;
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
