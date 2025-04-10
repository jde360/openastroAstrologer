import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:open_astro/core/error/error.dart';
import 'package:open_astro/core/error/error_handelar.dart';
import 'package:open_astro/model/puja_model.dart';
import 'package:open_astro/model/registration_model.dart';
import 'package:open_astro/model/specilization_model.dart';
import 'package:open_astro/repository/horoscope/horoscope.dart';
import 'package:open_astro/service/local_storage.dart';

class HoroscopeController extends GetxController {
  final HoroscopeRepository _horoscopeRepository = HoroscopeRepository();
  RxBool isLoading = true.obs;
  RxList<SpecializationModel> listOfSpecilizations =
      <SpecializationModel>[].obs;
  RxList<PujaModel> listOfPuja = <PujaModel>[].obs;

  final LocalStorage _localStorage = LocalStorage();

  @override
  void onInit() async {
    super.onInit();
    await getPujas();
    getSpecilizations();
  }

  Future<void> getPujas() async {
    try {
      isLoading(true);
      List<PujaModel> pujas = await _horoscopeRepository.gePujas();
      listOfPuja.assignAll(pujas);
    } on AppError catch (e) {
      ErrorHandelar(err: e);
    } catch (e) {
      ErrorHandelar(err: AppError(code: 500, err: '$e'));
    } finally {
      isLoading(false);
    }
  }

  Future<void> getSpecilizations() async {
    try {
      isLoading(true);
      List<SpecializationModel> specialization =
          await _horoscopeRepository.getSpecilizations();
      listOfSpecilizations.assignAll(specialization);
    } on AppError catch (e) {
      ErrorHandelar(err: e);
    } catch (e) {
      ErrorHandelar(err: AppError(code: 500, err: '$e'));
    } finally {
      isLoading(false);
    }
  }

  Future<RegistrationModel> register({
    required String displayName,
    required String realName,
    int? experience,
    String? desc,
    String? email,
    List<String>? specializations,
    List<String>? puja,
    required File image,
  }) async {
    try {
      isLoading(true);
      Map<String, dynamic> body = {
        'displayName': displayName,
        'realName': realName,
        'experience': experience,
        'desc': desc,
        'email': email,
        'specializations': specializations,
        'puja': puja,
      };
      // final isImageUpload = await _horoscopeRepository.profileImageUpload(
      //   image: image,
      //   fileName: realName,
      // );

      // log("imgUpload $isImageUpload");

      // if (isImageUpload) {
      RegistrationModel res = await _horoscopeRepository.registration(
        body: body,
      );
      await _localStorage.setLatest(false);
      Get.offAllNamed('/navigation');

      return res;
      // } else {
      //   throw AppError(code: 400, err: 'Image Upload error');
      // }
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
