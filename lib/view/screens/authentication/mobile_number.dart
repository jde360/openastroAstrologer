import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_astro/controller/auth.dart';
import 'package:open_astro/core/error/error.dart';
import 'package:open_astro/service/image_provider.dart';
import 'package:open_astro/view/widgets/primary_button.dart';
import 'package:open_astro/view/widgets/space.dart';

import '../../../core/error/error_handelar.dart';
import '../../widgets/reg_input.dart';

class MobileNoScreen extends StatelessWidget {
  MobileNoScreen({super.key});
  final TextEditingController _mobileNoController = TextEditingController(
    text: kDebugMode ? '1111111111' : '',
  );
  final AuthController _authController = Get.find();
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
            RegInput(
              controller: _mobileNoController,
              isNum: true,
              length: 10,
              name: 'Phone Number',
              hint: 'Enter your phone number',
            ),
            space(height: 27, width: 0),
            Obx(
              () => AppPrimaryButton(
                text: 'Get OTP',
                onClicked: () async {
                  await getOTP(context: context);
                },
                isLoading: _authController.isLoading.value,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getOTP({required BuildContext context}) async {
    try {
      bool res = await _authController.sendOTP(
        mobileNo: _mobileNoController.text,
      );
      if (res) {
        Get.offAllNamed(
          '/otp',
          arguments: {'mobileNo': _mobileNoController.text},
        );
      }
    } on AppError catch (e) {
      ErrorHandelar(err: e);
    } catch (e) {
      ErrorHandelar(err: AppError(code: 500, err: '$e'));
    }
  }
}
