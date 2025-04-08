import 'package:get/get.dart';
import 'package:open_astro/controller/auth.dart';
import 'package:open_astro/controller/horoscope.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HoroscopeController>(() => HoroscopeController());
  }
}
