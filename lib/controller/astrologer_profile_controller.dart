import 'dart:developer';

import 'package:get/get.dart';
import 'package:open_astro/repository/astrologer/astrologer.dart';

import '../core/error/error.dart';
import '../model/astrologer_profile_model.dart';

class AstrologerProfileController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool chatStatus = false.obs;
  Rx<AstrologerProfile> astrologerProfileData = AstrologerProfile().obs;
  final AstrologerRepository _astrologerRepository = AstrologerRepository();

  @override
  void onInit() async {
    super.onInit();
    await getAstrologerProfile();
  }

  Future<AstrologerProfile> getAstrologerProfile() async {
    try {
      isLoading(true);
      AstrologerProfile res =
          await _astrologerRepository.getAstrologerProfile();

      astrologerProfileData.value = res;
      log('astro profile : ${astrologerProfileData.value.realName}');

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

  Future<void> updateChatStatus({required bool status}) async {
    try {
      isLoading(true);
      Map body = {'status': status};

      await _astrologerRepository.updateChatStatus(body: body);

      // return res;
    } on AppError {
      rethrow;
    } catch (e) {
      log("error : $e");
      throw AppError(code: 400, err: '$e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateAudioStatus({required bool status}) async {
    try {
      isLoading(true);
      Map body = {'status': status};

      await _astrologerRepository.updateAudioStatus(body: body);
    } on AppError {
      rethrow;
    } catch (e) {
      log("error : $e");
      throw AppError(code: 400, err: '$e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateVideoStatus({required bool status}) async {
    try {
      isLoading(true);
      Map body = {'status': status};

      await _astrologerRepository.updateVideoStatus(body: body);
    } on AppError {
      rethrow;
    } catch (e) {
      log("error : $e");
      throw AppError(code: 400, err: '$e');
    } finally {
      isLoading(false);
    }
  }
}
