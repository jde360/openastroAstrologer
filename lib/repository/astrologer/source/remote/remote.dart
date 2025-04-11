import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:open_astro/model/astrologer_profile_model.dart';

import '../../../../core/error/error.dart';
import '../../../../core/network/http_client.dart';
import '../../../../model/followers_list.dart';
import '../../../../service/local_storage.dart';

class AstrologerRemoteDataSource {
  final API api;
  AstrologerRemoteDataSource({required this.api});

  final LocalStorage _localStorage = LocalStorage();

  Future<AstrologerProfile> getAstrologerProfile() async {
    try {
      await _localStorage.init();
      final token = await _localStorage.getToken();
      api.dio.options.headers["Authorization"] = "Bearer $token";

      Response response = await api.dio.get("/account/astrologer/");

      return AstrologerProfile.fromJson(response.data['result']);
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

  Future<void> updateChatStatus({required Map body}) async {
    try {
      await _localStorage.init();
      final token = await _localStorage.getToken();
      api.dio.options.headers["Authorization"] = "Bearer $token";

      Response response = await api.dio.put(
        "/astroProfile/chatStatus",
        data: body,
      );
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

  Future<void> updateAudioStatus({required Map body}) async {
    try {
      await _localStorage.init();
      final token = await _localStorage.getToken();
      api.dio.options.headers["Authorization"] = "Bearer $token";

      Response response = await api.dio.put(
        "/astroProfile/audioCallStatus",
        data: body,
      );
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

  Future<void> updateVideoStatus({required Map body}) async {
    try {
      await _localStorage.init();
      final token = await _localStorage.getToken();
      api.dio.options.headers["Authorization"] = "Bearer $token";

      Response response = await api.dio.put(
        "/astroProfile/videoCallStatus",
        data: body,
      );
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

  Future<List<FollowersList>> getFollowers() async {
    try {
      await _localStorage.init();
      final token = await _localStorage.getToken();
      api.dio.options.headers["Authorization"] = "Bearer $token";
      List<FollowersList> followers = [];

      Response response = await api.dio.get("/follower/astrologer");

      if (response.statusCode == 200 && response.data != null) {
        List<dynamic> result = response.data;

        for (var data in result) {
          followers.add(FollowersList.fromJson(data));
        }
      }

      return followers;
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
