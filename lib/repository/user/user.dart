import 'package:open_astro/repository/user/source/remote/remote.dart';

import '../../core/error/error.dart';
import '../../model/user_list_model.dart';

import '../../core/network/http_client.dart';

class UserRepository {
  final API _api = API();

  Future<List<UserListModel>> getUserList() async {
    try {
      return await UserRemoteDataSource(api: _api).getUserList();
    } on AppError {
      throw AppError;
    }
  }
}
