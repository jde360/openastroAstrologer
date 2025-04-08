import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:open_astro/core/error/error.dart';

import '../../view/widgets/snack_bar.dart';

class ErrorHandelar {
  final AppError err;
  ErrorHandelar({required this.err}) {
    BuildContext? context = Get.context;
    if (err.code == 500) {
      Get.toNamed('/error', arguments: {'error': err.err});
    }
    if (err.code == 400) {
      showSnackbar(
        context: context!,
        message: kDebugMode ? err.err : 'Somethingwents wrong!',
      );
    }
  }
}
