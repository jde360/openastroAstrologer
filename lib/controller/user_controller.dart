import 'package:get/get.dart';
import '../core/error/error.dart';
import '../core/error/error_handelar.dart';
import '../model/user_list_model.dart';

import '../repository/user/user.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  RxBool isLoading = true.obs;
  RxList<UserListModel> listOfUser = <UserListModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserList();
  }

  Future<void> getUserList() async {
    try {
      isLoading(true);

      List<UserListModel> userList = await _userRepository.getUserList();

      listOfUser.assignAll(userList);
    } on AppError catch (e) {
      ErrorHandelar(err: e);
    } catch (e) {
      ErrorHandelar(err: AppError(code: 500, err: '$e'));
    } finally {
      isLoading(false);
    }
  }
}
