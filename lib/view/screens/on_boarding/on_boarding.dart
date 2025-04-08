import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/core/font/app_font.dart';
import 'package:open_astro/service/local_storage.dart';
import 'package:open_astro/view/widgets/space.dart';

import 'widgets/page_one.dart';
import 'widgets/page_three.dart';
import 'widgets/page_two.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final LocalStorage _localStorage = LocalStorage();
  final List<Widget> pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
  ];

  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (value) {
            currentIndex = value;
            setState(() {});
          },
          itemCount: pages.length,
          itemBuilder: (context, index) => pages[currentIndex],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120.h,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      currentIndex == pages.length - 1
                          ? null
                          : _pageController.jumpToPage(3);
                    },
                    child: Text(
                      'Skip',
                      style: appText(size: 19, weight: FontWeight.w500),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      currentIndex != pages.length - 1
                          ? _pageController.nextPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.linear,
                          )
                          : {
                            await _localStorage.setOnboardedUser(),
                            Get.offAllNamed('/mobile-no'),
                          };
                    },
                    child: Text(
                      'Next',
                      style: appText(size: 19, weight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              space(height: 15, width: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 2,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          currentIndex == 0
                              ? AppColor().primary
                              : AppColor().primary.withOpacity(0.4),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 2,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          currentIndex == 1
                              ? AppColor().primary
                              : AppColor().primary.withOpacity(0.4),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 2,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          currentIndex == 2
                              ? AppColor().primary
                              : AppColor().primary.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
