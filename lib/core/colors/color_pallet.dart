import 'package:flutter/material.dart';

class AppColor {
  final Color _bg = const Color(0xFF45131D);
  final Color _primary = const Color(0xFFFFF0BE);
  final Color _secondary = const Color(0XFF814B0B);
  final Color _textColor = const Color(0XFFFFFFFF);
  final Color _success = const Color(0XFF28BF14);
  final Color _error = const Color(0XFFD80000);
  final Color _warning = const Color(0XFFFFBF00);
  Color get primary => _primary;
  Color get secondary => _secondary;
  Color get textColor => _textColor;
  Color get bg => _bg;
  Color get success => _success;
  Color get error => _error;
  Color get warning => _warning;
}
