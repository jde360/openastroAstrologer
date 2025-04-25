import 'package:flutter/foundation.dart';

class AppConstant {
  //development
  final String _devUrl = 'http://192.168.1.19:7111/api/v1';
  final String _devPrivacyPolicy = 'http://192.168.1.12:7111/api/v1';
  final String _devTermAndCondition = 'http://192.168.1.12:7111/api/v1';
  final String _devSocketUrl = 'http://192.168.1.19:7111/';
  //production
  final String _prodUrl = 'http://192.168.1.12:7111/api/v1';
  final String _prodPrivacyPolicy = 'http://192.168.1.12:7111/api/v1';
  final String _prodTermAndCondition = 'http://192.168.1.12:7111/api/v1';
  final String _prodSocketUrl = 'http://192.168.1.19:7111';

  String get baseUrl => kDebugMode ? _devUrl : _prodUrl;
  String get provacyPolicy =>
      kDebugMode ? _devPrivacyPolicy : _prodPrivacyPolicy;
  String get termAndConditions =>
      kDebugMode ? _devTermAndCondition : _prodTermAndCondition;
  String get socketUrl => kDebugMode ? _devSocketUrl : _prodSocketUrl;
}
