import 'package:open_astro/core/network/http_client.dart';
import 'package:open_astro/repository/astrologer/source/remote/remote.dart';

import '../../core/error/error.dart';
import '../../model/astrologer_profile_model.dart';

class AstrologerRepository {
  final API _api = API();

  Future<AstrologerProfile> getAstrologerProfile() async {
    try {
      return await AstrologerRemoteDataSource(api: _api).getAstrologerProfile();
    } on AppError {
      throw AppError;
    }
  }

  Future<void> updateChatStatus({required Map body}) async {
    try {
      return await AstrologerRemoteDataSource(
        api: _api,
      ).updateChatStatus(body: body);
    } on AppError {
      throw AppError;
    }
  }

  Future<void> updateAudioStatus({required Map body}) async {
    try {
      return await AstrologerRemoteDataSource(
        api: _api,
      ).updateAudioStatus(body: body);
    } on AppError {
      throw AppError;
    }
  }

  Future<void> updateVideoStatus({required Map body}) async {
    try {
      return await AstrologerRemoteDataSource(
        api: _api,
      ).updateVideoStatus(body: body);
    } on AppError {
      throw AppError;
    }
  }
}
