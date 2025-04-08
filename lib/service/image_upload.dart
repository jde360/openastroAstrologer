import 'dart:developer';
import 'dart:io';

import 'package:open_astro/core/network/http_client.dart';
import 'package:dio/dio.dart';
import 'package:open_astro/core/error/error.dart';
import 'package:open_astro/service/local_storage.dart';

class ImageHandelar {
  final API api;
  ImageHandelar({required this.api});
  final LocalStorage _localStorage = LocalStorage();

  Future<bool> imageUpload({
    required File image,
    required String fileName,
  }) async {
    try {
      await _localStorage.init();
      final token = await _localStorage.getToken();
      api.dio.options.headers["Authorization"] = "Bearer $token";

      var formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path, filename: fileName),
      });

      log("formdata $formData");

      Response response = await api.dio.put(
        '/account/astrologer/profile',
        data: formData,
      );

      log("response $response");
      return response.statusCode == 200;
    } on DioException catch (error) {
      throw AppError(
        code: 400,
        err: error.response?.statusMessage ?? 'Upload failed',
      );
    } catch (_) {
      throw 'Something Went Wrong';
    }
  }
}
