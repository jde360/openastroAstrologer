import 'package:get/get.dart';

import '../view/screens/authentication/mobile_number.dart';
import '../view/screens/authentication/otp_screen.dart';
import '../view/screens/authentication/registartation.dart';
import '../view/screens/chat_participents/chat_participents.dart';
import '../view/screens/followers/followers.dart';
import '../view/screens/fregment/fregment_screen.dart';
import '../view/screens/on_boarding/on_boarding.dart';
import '../view/screens/splash/splash_screen.dart';
import '../view/screens/tips/tips_screen.dart';

List<GetPage> appRoute = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/mobile-no', page: () => const MobileNoScreen()),
  GetPage(name: '/onboarding', page: () => const OnBoarding()),
  GetPage(name: '/otp', page: () => const OtpScreen()),
  GetPage(name: '/registration', page: () => RegistrationScreen()),
  GetPage(name: '/fregment', page: () => FregmentScreen()),
  GetPage(name: '/tips', page: () => const TipsScreen()),
  GetPage(name: '/chat-partcipents', page: () => const ChatParticipents()),
  GetPage(name: '/followers', page: () => const FollowersScreen()),
];
