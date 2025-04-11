import 'package:get/get.dart';
import 'package:open_astro/controller/astrologer_profile_controller.dart';
import 'package:open_astro/controller/auth.dart';
import 'package:open_astro/controller/chat_list_controller.dart';
import 'package:open_astro/controller/horoscope.dart';

import '../controller/user_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HoroscopeController>(() => HoroscopeController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<AstrologerProfileController>(
      () => AstrologerProfileController(),
    );
    Get.lazyPut<ChatListController>(() => ChatListController());
  }
}
