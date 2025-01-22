import 'package:dio/dio.dart';

class NetworkClient {
  Dio dio = Dio();

  NetworkClient() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
    );
    dio = Dio(options);
  }
  Dio get request => dio;
}
