import 'package:get/get.dart';

double percentWidth({int percent = 100}) {
  double width = Get.width;
  return (width * percent) / 100;
}

double percentHeight({int percent = 100}) {
  double height = Get.height;
  return (height * percent) / 100;
}
