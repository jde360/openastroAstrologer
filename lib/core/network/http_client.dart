import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:open_astro/core/values/urls.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  late Dio _dio;
  API() {
    _dio = Dio();
    _dio.options.baseUrl = AppConstant().baseUrl;
    _dio.options.sendTimeout = const Duration(seconds: 60);
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.interceptors.add(
      PrettyDioLogger(
        compact: true,
        enabled: kDebugMode,
        error: true,
        request: true,
        responseBody: true,
        responseHeader: false,
        requestBody: true,
        requestHeader: true,
      ),
    );
  }
  Dio get dio => _dio;
}
