import 'package:dio/dio.dart';
import 'package:open_astro/core/network/http_client.dart';
import 'package:open_astro/model/puja_model.dart';
import 'package:open_astro/model/registration_model.dart';
import 'package:open_astro/model/specilization_model.dart';
import 'package:open_astro/service/local_storage.dart';

import '../../../../core/error/error.dart';

class HoroscopeRemoteDataSource {
  final API api;
  HoroscopeRemoteDataSource({required this.api});

  final LocalStorage _localStorage = LocalStorage();

  Future<List<SpecializationModel>> getSpecilizations() async {
    try {
      List<SpecializationModel> specilization = [];
      Response response = await api.dio.get('/specializations');
      if (response.statusCode == 200) {
        response.data.isNotEmpty
            ? {
              response.data.forEach((data) {
                specilization.add(SpecializationModel.fromJson(data));
              }),
            }
            : null;
      }
      return specilization;
    } on DioException catch (e) {
      throw AppError(
        code: e.response!.statusCode ?? 400,
        err: e.response!.statusMessage ?? 'Unknown Error',
      );
    }
  }

  Future<List<PujaModel>> getPujas() async {
    try {
      List<PujaModel> pujas = [];
      Response response = await api.dio.get('/puja');
      // if (response.statusCode == 200) {
      //   response.data.isNotEmpty
      //       ? {
      //         response.data.forEach((data) {
      //           pujas.add(PujaModel.fromJson(data));
      //         }),
      //       }
      //       : null;
      // }

      if (response.statusCode == 200 && response.data['result'] != null) {
        List<dynamic> result = response.data['result'];
        for (var data in result) {
          pujas.add(PujaModel.fromJson(data));
        }
      }
      return pujas;
    } on DioException catch (e) {
      throw AppError(
        code: e.response!.statusCode ?? 400,
        err: e.response!.statusMessage ?? 'Unknown Error',
      );
    }
  }

  Future<RegistrationModel> registration({
    required Map<String, dynamic> body,
  }) async {
    try {
      await _localStorage.init();
      final token = await _localStorage.getToken();
      api.dio.options.headers["Authorization"] = "Bearer ${token}";

      Response response = await api.dio.patch(
        '/account/astrologer/',
        data: body,
        // options: Options(
        //   contentType: Headers.formUrlEncodedContentType,
        //   // headers: {'Authorization': 'Bearer $token'},
        // ),
      );
      return RegistrationModel.fromJson(response.data);
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
