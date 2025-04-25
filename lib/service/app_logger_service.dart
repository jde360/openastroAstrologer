import 'package:logger/logger.dart';

class AppLog {
  static final Logger _logger = Logger();
  static error({required String message}) {
    _logger.e(message);
  }

  static debug({required String message}) {
    _logger.d(message);
  }

  static warning({required String message}) {
    _logger.w(message);
  }

  static info({required String message}) {
    _logger.i(message);
  }
}
