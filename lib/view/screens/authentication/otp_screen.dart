import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:pinput/pinput.dart';

import '../../../core/font/app_font.dart';
import '../../../service/image_provider.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/space.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: AppImageProvider.asset(asset: 'auth_image'),
            ),
            space(height: 90, width: 0),
            Text(
              'Enter your OTP',
              style: appText(size: 16, weight: FontWeight.w600),
            ),
            space(height: 11, width: 0),
            SizedBox(
              height: 50.h,
              child: Pinput(
                defaultPinTheme: PinTheme(
                  height: 59.h,
                  width: 59.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor().primary.withOpacity(0.2),
                  ),
                ),
                controller: TextEditingController(),
                length: 4,
              ),
            ),
            space(height: 36, width: 0),
            AppPrimaryButton(
              text: 'Verify OTP',
              onClicked: () {},
              isLoading: false,
            ),
            space(height: 36, width: 0),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Didn\'t receive OTP? ',
                style: appText(size: 16, weight: FontWeight.w400),
              ),
              TextSpan(
                text: 'Resend OTP',
                style: appText(size: 16, weight: FontWeight.w600),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
