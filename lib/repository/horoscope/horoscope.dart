import 'dart:io';

import 'package:open_astro/core/network/http_client.dart';
import 'package:open_astro/model/puja_model.dart';
import 'package:open_astro/model/registration_model.dart';
import 'package:open_astro/model/specilization_model.dart';
import 'package:open_astro/service/image_upload.dart';

import '../../../../core/error/error.dart';
import 'source/remote/remote.dart';

class HoroscopeRepository {
  final API _api = API();
  Future<List<SpecializationModel>> getSpecilizations() async {
    try {
      return await HoroscopeRemoteDataSource(api: _api).getSpecilizations();
    } on AppError {
      throw AppError;
    }
  }

  Future<List<PujaModel>> gePujas() async {
    try {
      return await HoroscopeRemoteDataSource(api: _api).getPujas();
    } on AppError {
      throw AppError;
    }
  }

  Future<RegistrationModel> registration({
    required Map<String, dynamic> body,
  }) async {
    try {
      return await HoroscopeRemoteDataSource(
        api: _api,
      ).registration(body: body);
    } on AppError {
      throw AppError;
    }
  }

  Future<bool> profileImageUpload({
    required File image,
    required String fileName,
  }) async {
    try {
      return await ImageHandelar(
        api: _api,
      ).imageUpload(image: image, fileName: fileName);
    } on AppError {
      throw AppError;
    }
  }
}
