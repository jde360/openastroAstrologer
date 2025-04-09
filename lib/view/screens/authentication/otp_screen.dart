import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/core/error/error.dart';
import 'package:open_astro/core/error/error_handelar.dart';
import 'package:open_astro/service/local_storage.dart';
import 'package:pinput/pinput.dart';

import '../../../controller/auth.dart';
import '../../../core/font/app_font.dart';
import '../../../model/opt_verification_model.dart';
import '../../../service/image_provider.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/space.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _seconds = 30;
  Timer? _timer;
  final TextEditingController _otpController = TextEditingController(
    text: kDebugMode ? '1235' : '',
  );
  final AuthController _authController = Get.find();
  final LocalStorage _localStorage = LocalStorage();
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

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
                controller: _otpController,
                length: 4,
              ),
            ),
            space(height: 36, width: 0),
            Obx(
              () => AppPrimaryButton(
                text: 'Verify OTP',
                onClicked: () {
                  _verifyOTP();
                },
                isLoading: _authController.isLoading.value,
              ),
            ),
            space(height: 36, width: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t receive OTP? ',
                  style: appText(size: 16, weight: FontWeight.w400),
                ),
                _seconds != 0
                    ? Text(
                      '$_seconds S',
                      style: appText(size: 16, weight: FontWeight.w600),
                    )
                    : InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,

                      onTap: () {
                        // _resendOTP();
                      },
                      child: Text(
                        'Resend OTP',
                        style: appText(size: 16, weight: FontWeight.w600),
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_seconds == 0) {
        _timer!.cancel();
        return;
      }
      setState(() {
        _seconds--;
      });
    });
  }

  // Future<void> _resendOTP() async {
  //   try {} catch (e) {}
  // }

  Future<void> _verifyOTP() async {
    try {
      OTPVerificationModel res = await _authController.verifyOTP(
        mobileNo: '${Get.arguments['mobileNo']}',
        OTP: _otpController.text,
        fcm: '',
      );

      _localStorage.setToken(token: res.token!);
      await _localStorage.setLatest(res.latest);

      if (res.latest!) {
        Get.offAllNamed('/registration');
        return;
      } else {
        Get.offAllNamed('/navigation');
      }
      // Get.offAllNamed('/registration');
      // if (isLatest) {
      //   Get.offAllNamed('/navigation');
      // } else {
      //   Get.offAllNamed("/registration");
      // }
    } on AppError catch (err) {
      ErrorHandelar(err: err);
    } catch (err) {
      ErrorHandelar(err: AppError(code: 500, err: '$err'));
    }
  }
}
