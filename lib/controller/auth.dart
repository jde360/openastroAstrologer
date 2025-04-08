import 'package:get/get.dart';
import 'package:open_astro/core/error/error.dart';
import 'package:open_astro/model/opt_verification_model.dart';

import '../repository/auth/auth.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final AuthRepository _repository = AuthRepository();
  Future<bool> sendOTP({required String mobileNo}) async {
    try {
      isLoading(true);
      Map body = {'phoneNumber': mobileNo};
      bool res = await _repository.getOTP(body: body);
      return res;
    } on AppError {
      rethrow;
    } catch (e) {
      throw AppError(code: 400, err: '$e');
    } finally {
      isLoading(false);
    }
  }

  Future<OTPVerificationModel> verifyOTP({
    required String mobileNo,
    required String OTP,
    required String fcm,
  }) async {
    try {
      isLoading(true);
      Map body = {'phoneNumber': mobileNo, 'otp': OTP, 'fcm': fcm};
      OTPVerificationModel res = await _repository.verifyOTP(body: body);
      return res;
    } on AppError {
      rethrow;
    } catch (e) {
      throw AppError(code: 400, err: '$e');
    } finally {
      isLoading(false);
    }
  }
}
