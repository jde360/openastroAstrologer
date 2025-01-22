import 'package:flutter/material.dart';
import 'package:open_astro/service/image_provider.dart';
import 'package:open_astro/view/widgets/primary_button.dart';
import 'package:open_astro/view/widgets/space.dart';

import '../../widgets/reg_input.dart';

class MobileNoScreen extends StatelessWidget {
  const MobileNoScreen({super.key});

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
              controller: TextEditingController(),
              isNum: true,
              length: 10,
              name: 'Phone Number',
              hint: 'Enter your phone number',
            ),
            space(height: 27, width: 0),
            AppPrimaryButton(
                text: 'Get OTP', onClicked: () {}, isLoading: false)
          ],
        ),
      ),
    );
  }
}
