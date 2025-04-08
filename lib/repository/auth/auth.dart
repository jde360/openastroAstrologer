import 'package:open_astro/core/error/error.dart';
import 'package:open_astro/core/network/http_client.dart';

import '../../model/opt_verification_model.dart';
import 'source/remote/remote.dart';

class AuthRepository {
  final API api = API();

  Future<bool> getOTP({required Map body}) async {
    try {
      return await AuthRemoteDataSource(api: api).getOTP(body: body);
    } on AppError {
      throw AppError;
    }
  }

  Future<OTPVerificationModel> verifyOTP({required Map body}) async {
    try {
      return await AuthRemoteDataSource(api: api).verifyOTP(body: body);
    } on AppError {
      throw AppError;
    }
  }
}
