import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_astro/service/local_storage.dart';

import '../../../service/image_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalStorage _localStorage = LocalStorage();
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _localStorage.init();
      bool onBoarded = await _localStorage.getOnboardingStatus();
      bool isLatest = await _localStorage.getlatestStatus();
      if (onBoarded) {
        //check login
        String token = await _localStorage.getToken();
        if (token.isEmpty) {
          Get.offAllNamed('/mobile-no');
          return;
        } else {
          if (!isLatest) {
            Get.offAllNamed('/navigation');
          } else {
            Get.offAllNamed("/registration");
          }
        }
      } else {
        //send to onboarding screen
        Get.offAllNamed('/onboarding');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Center(child: AppImageProvider.asset(asset: 'appLogo')),
      ),
    );
  }
}
