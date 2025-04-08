import 'package:dio/dio.dart';
import 'package:open_astro/core/network/http_client.dart';
import 'package:open_astro/model/opt_verification_model.dart';
import 'package:open_astro/service/local_storage.dart';

import '../../../../core/error/error.dart';

class AuthRemoteDataSource {
  final API api;
  AuthRemoteDataSource({required this.api});

  final LocalStorage _localStorage = LocalStorage();
  // final API _api = API();
  Future<bool> getOTP({required Map body}) async {
    try {
      Response response = await api.dio.post(
        '/account/astrologer/login',
        data: body,
      );
      return response.statusCode == 200;
    } on DioException catch (e) {
      throw AppError(
        code: e.response!.statusCode ?? 400,
        err: e.response!.statusMessage ?? 'Unknown Error',
      );
    }
  }

  Future<OTPVerificationModel> verifyOTP({required Map body}) async {
    try {
      Response response = await api.dio.post(
        '/account/astrologer/verify',
        data: body,
      );
      if (response.statusCode == 200) {
        return OTPVerificationModel.fromJson(response.data);
        // return OTPVerificationModel(
        //   latest: true,
        //   token: response.data["token"],
        // );
      }
      return OTPVerificationModel(latest: false, token: '');
    } on DioException catch (e) {
      throw AppError(
        code: e.response!.statusCode ?? 400,
        err:
            e.response!.data['error'] ??
            e.response!.statusMessage ??
            'Unknown Error',
      );
    }
  }
}
