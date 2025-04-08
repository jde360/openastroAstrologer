import 'dart:developer';

import 'package:flutter/foundation.dart';

void appLoger({required String tag, required String message}) {
  kDebugMode ? log(':::: OPENASTRO - ASTRO :::: $tag :::: $message') : null;
}
