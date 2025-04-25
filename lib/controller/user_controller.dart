import 'dart:developer';

import 'package:get/get.dart';
import 'package:open_astro/model/user_details_model.dart';
import '../core/error/error.dart';
import '../core/error/error_handelar.dart';
import '../model/user_list_model.dart';

import '../repository/user/user.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  Rx<UserDetailsModel> userProfileData = UserDetailsModel().obs;
  RxBool isLoading = true.obs;
  RxList<UserListModel> listOfUser = <UserListModel>[].obs;

  Future<UserDetailsModel> getUserProfile({required String id}) async {
    try {
      isLoading(true);
      UserDetailsModel res = await _userRepository.getUserDetails(id: id);

      userProfileData.value = res;
      log('astro profile : ${userProfileData.value}');

      return res;
    } on AppError {
      rethrow;
    } catch (e) {
      log("error : $e");
      throw AppError(code: 400, err: '$e');
    } finally {
      isLoading(false);
    }
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
