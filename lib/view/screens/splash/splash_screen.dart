import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/image_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => Get.toNamed('/registration'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Center(
          child: AppImageProvider.asset(asset: 'appLogo'),
        ),
      ),
    );
  }
}
