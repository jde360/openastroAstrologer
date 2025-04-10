import 'package:get/get.dart';
import 'package:open_astro/view/screens/edit_profile/edit_profile.dart';

import '../binding/auth.dart';
import '../core/error/error_screen.dart';
import '../view/screens/authentication/mobile_number.dart';
import '../view/screens/authentication/otp_screen.dart';
import '../view/screens/authentication/registartation.dart';
import '../view/screens/chat/chat.dart';
import '../view/screens/chat_participents/chat_participents.dart';
import '../view/screens/followers/followers.dart';
import '../view/screens/my_profile/my_profile.dart';
import '../view/screens/navigation/navigation_screen.dart';
import '../view/screens/on_boarding/on_boarding.dart';
import '../view/screens/splash/splash_screen.dart';
import '../view/screens/tips/tips_screen.dart';

List<GetPage> appRoute = [
  GetPage(name: '/', page: () => const SplashScreen(), binding: AppBinding()),
  GetPage(
    name: '/mobile-no',
    page: () => MobileNoScreen(),
    binding: AppBinding(),
  ),
  GetPage(
    name: '/onboarding',
    page: () => const OnBoarding(),
    binding: AppBinding(),
  ),
  GetPage(name: '/otp', page: () => const OtpScreen(), binding: AppBinding()),
  GetPage(name: '/registration', page: () => RegistrationScreen()),
  GetPage(
    name: '/navigation',
    page: () => const NavigationScreen(),
    binding: AppBinding(),
  ),
  GetPage(name: '/tips', page: () => const TipsScreen(), binding: AppBinding()),
  GetPage(
    name: '/error',
    page: () => const ErrorScreen(),
    binding: AppBinding(),
  ),
  GetPage(
    name: '/chat-partcipents',
    page: () => const ChatParticipents(),
    binding: AppBinding(),
  ),
  GetPage(
    name: '/followers',
    page: () => const FollowersScreen(),
    binding: AppBinding(),
  ),
  GetPage(name: '/my-profile', page: () => MyProfile(), binding: AppBinding()),
  GetPage(name: '/chat', page: () => const ChatScreen(), binding: AppBinding()),
  GetPage(
    name: '/edit-profile',
    page: () => EditProfile(),
    binding: AppBinding(),
  ),
];
